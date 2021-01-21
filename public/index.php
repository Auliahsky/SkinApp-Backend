<?php
    use Psr\Http\Message\ResponseInterface as Response;
    use Psr\Http\Message\ServerRequestInterface as Request;
    use Slim\Factory\AppFactory;

    require '../vendor/autoload.php';
    // require '../includes/DbConnect.php';
    require '../includes/DbOperations.php';

    $app = AppFactory::create();

    $app->addBodyParsingMiddleware();

    $app->add(new Tuupola\Middleware\HttpBasicAuthentication([
        "secure"=>false,
        "users" => [
            "skinapp" => "123456",
        ]
    ]));

    //Pembuatan Akun (Register)
    $app->post('/SkinAppApi/public/createUser',function(Request $request, Response $response){
        if(!haveEmptyParameters(array('email','password','name','nope'),$request,$response)){
            $request_data=$request->getParsedBody();

            $email=$request_data['email'];
            $password=$request_data['password'];
            $name=$request_data['name'];
            $nope=$request_data['nope'];

            $hash_password = password_hash($password,PASSWORD_DEFAULT);
            $db=new DbOperations;

            $result = $db->createUser($email,$hash_password,$name,$nope);
            if($result==USER_CREATED){
                $message=array();
                $message['error']=false;
                $message['message']='Akun berhasil dibuat';

                $response->getBody()->write(json_encode($message));
                return $response
                            ->withHeader('Content-type','application/json')
                            ->withStatus(201);
            }else if($result==USER_FAILURE){
                $message=array();
                $message['error']=true;
                $message['message']='Ada kesalahan';

                $response->getBody()->write(json_encode($message));
                return $response
                            ->withHeader('Content-type','application/json')
                            ->withStatus(422);
            }else if($result==USER_EXIST){
                $message=array();
                $message['error']=true;
                $message['message']='Akun sudah ada';

                $response->getBody()->write(json_encode($message));
                return $response
                            ->withHeader('Content-type','application/json')
                            ->withStatus(422);
            }
        }

        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(422);
    });

    //Lupa Password 
    $app->post('/DrTravelApi/public/forgetPass',function(Request $request, Response $response){
        if(!haveEmptyParameters(array('email'),$request,$response)){
            $request_data=$request->getParsedBody();

            $email=$request_data['email'];
            $db=new DbOperations;
            $result = $db->forgetPass($email);

            if($result==EMAIL_SENDED){
                $message=array();
                $message['error']=false;
                $message['message']='email has been sended';

                $response->getBody()->write(json_encode($message));
                return $response
                            ->withHeader('Content-type','application/json')
                            ->withStatus(201);

            }else if($result==EMAIL_NOT_FOUND){
                $message=array();
                $message['error']=true;
                $message['message']='some error occurred';

                $response->getBody()->write(json_encode($message));
                return $response
                            ->withHeader('Content-type','application/json')
                            ->withStatus(422);
                            
            } else if($result==USER_EXIST){
                $message=array();
                $message['error']=true;
                $message['message']='Email sudah dikirim';

                $response->getBody()->write(json_encode($message));
                return $response
                            ->withHeader('Content-type','application/json')
                            ->withStatus(422);
        }
    }
        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(422);
    });

    //Login Akun
    $app->post('/SkinAppApi/public/userLogin', function(Request $request,Response $response){
        if(!haveEmptyParameters(array('email','password'),$request,$response)){
            $request_data=$request->getParsedBody();
            $email=$request_data['email'];
            $password=$request_data['password'];

            $db=new DbOperations;
            $result=$db->userLogin($email,$password);

            if($result==USER_AUTHENTICATED){
                $user=$db->getUserByEmail($email);
                $response_data=array();
                $response_data['error']=false;
                $response_data['message']='Login berhasil';
                $response_data['user']=$user;

                $response->getBody()->write(json_encode($response_data));

                return $response
                    ->withHeader('Content-type','application/json')
                    ->withStatus(200);
            } else if($result==USER_NOT_FOUND){
                $response_data=array();
                $response_data['error']=true;
                $response_data['message']='Akun tidak ditemukan';
                

                $response->getBody()->write(json_encode($response_data));

                return $response
                    ->withHeader('Content-type','application/json')
                    ->withStatus(200);
            } else if($result==USER_PASSWORD_DO_NOT_MATCH){
                $response_data=array();
                $response_data['error']=true;
                $response_data['message']='Email atau password salah !';

                $response->getBody()->write(json_encode($response_data));

                return $response
                    ->withHeader('Content-type','application/json')
                    ->withStatus(200);
            }
        }
        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(422);
    });

    //data dokter master
    $app->get('/SkinAppApi/public/allDokter',function(Request $request,Response $response){
        $db=new DbOperations;

        $dokter_master=$db->getAllDokter();
        $response_data=array();
        $response_data['error']=false;
        $response_data['dokter']=$dokter_master;

        $response->getBody()->write(json_encode($response_data));

        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(200);
    });

    //data detail dokter
    $app->post('/SkinAppApi/public/detailDokter', function(Request $request,Response $response){
        if(!haveEmptyParameters(array('dokter'),$request,$response)){
            $request_data=$request->getParsedBody();

            $nama_dokter=$request_data['dokter'];

            $db=new DbOperations;

            $dokter_master=$db->getDetailDokter($nama_dokter);
            $response_data=array();
            $response_data['error']=false;
            $response_data['dokter']=$dokter_master;

            $response->getBody()->write(json_encode($response_data));

            return $response
                ->withHeader('Content-type','application/json')
                ->withStatus(200);
        }
        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(422);
    });

    //data all produk
    $app->post('/SkinAppApi/public/allProduk', function(Request $request,Response $response){
        if(!haveEmptyParameters(array('produk'),$request,$response)){
            $request_data=$request->getParsedBody();

            $nama_merk=$request_data['produk'];

            $db=new DbOperations;

            $produk_master=$db->getAllProduk($nama_merk);
            $response_data=array();
            $response_data['error']=false;
            $response_data['produk']=$produk_master;

            $response->getBody()->write(json_encode($response_data));

            return $response
                ->withHeader('Content-type','application/json')
                ->withStatus(200);
        }
        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(422);
    });

    //Cari Produk
    $app->post('/SkinAppApi/public/searchProduk', function(Request $request,Response $response){
        if(!haveEmptyParameters(array('produk'),$request,$response)){
            $request_data=$request->getParsedBody();

            $nama_produk=$request_data['produk'];

            $db=new DbOperations;

            $produk_master=$db->produkSearch($nama_produk);
            $response_data=array();
            $response_data['error']=false;
            $response_data['produk']=$produk_master;

            $response->getBody()->write(json_encode($response_data));

            return $response
                ->withHeader('Content-type','application/json')
                ->withStatus(200);
        }
        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(422);
    });

    //data detail Produk
    $app->post('/SkinAppApi/public/detailProduk', function(Request $request,Response $response){
        if(!haveEmptyParameters(array('nama_produk'),$request,$response)){
            $request_data=$request->getParsedBody();

            $nama_produk=$request_data['nama_produk'];

            $db=new DbOperations;

            $produk_master=$db->getDetailProduk($nama_produk);
            $response_data=array();
            $response_data['error']=false;
            $response_data['produk']=$produk_master;

            $response->getBody()->write(json_encode($response_data));

            return $response
                ->withHeader('Content-type','application/json')
                ->withStatus(200);
        }
        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(422);
    });

    //tambah produk ke keranjang
    $app->post('/SkinAppApi/public/addCart',function(Request $request, Response $response){
        if(!haveEmptyParameters(array('nm_crprod','merk_crprod','quantity_crprod','hrg_crprod','total'),$request,$response)){
            $request_data=$request->getParsedBody();

            $nm_crprod=$request_data['nm_crprod'];
            $merk_crprod=$request_data['merk_crprod'];
            $quantity_crprod=$request_data['quantity_crprod'];
            $hrg_crprod=$request_data['hrg_crprod'];
            $total=$request_data['total'];

            $db=new DbOperations;
            $result = $db->addToCart($nm_crprod,$merk_crprod,$quantity_crprod,$hrg_crprod,$total);
            if($result==DATA_MASUK){
                $message=array();
                $message['error']=false;
                $message['message']='Produk berhasil ditambahkan';

                $response->getBody()->write(json_encode($message));
                return $response
                            ->withHeader('Content-type','application/json')
                            ->withStatus(201);
            }else if($result==DATA_GAGAL_MASUK){
                $message=array();
                $message['error']=true;
                $message['message']='Produk gagal ditambahkan';

                $response->getBody()->write(json_encode($message));
                return $response
                            ->withHeader('Content-type','application/json')
                            ->withStatus(422);
            }
        }

        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(422);
    });

    //update user
    $app->put('/DrTravelApi/public/updateUser/{id}',function(Request $request,Response $response,array $args){
        $id=$args['id'];

        if(!haveEmptyParameters(array('email','name'),$request,$response)){
            $request_data=$request->getParsedBody();
            $email=$request_data['email'];
            $name=$request_data['name'];

            $db=new DbOperations;
            if($db->updateUser($email,$name,$id)){
                $response_data=array();
                $response_data['error']=false;
                $response_data['message']='User Update Successfully';
                $user=$db->getUserByEmail($email);
                $response_data['user']=$user;

                $response->getBody()->write(json_encode($response_data));

                return $response
                    ->withHeader('Content-type', 'application/json')
                    ->withStatus(200);
            }else{
                $response_data=array();
                $response_data['error']=true;
                $response_data['message']='Please Try Again Later';
                $user=$db->getUserByEmail($email);
                $response_data['user']=$user;

                $response->getBody()->write(json_encode($response_data));

                return $response
                    ->withHeader('Content-type', 'application/json')
                    ->withStatus(200);
            }
        }
        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(200);
    });


    //hapus user
    $app->delete('/DrTravelApi/public/deleteUser/{id}',function(Request $request, Response $response, array $args){
        $id=$args['id'];

        $db=new DbOperations;

        $response_data=array();
        if($db->deleteUser($id)){
            $response_data['error']=false;
            $response_data['message']='User has been deleted';
        } else{
            $response_data['error']=true;
            $response_data['message']='Please try again later';
        }

        $response->getBody()->write(json_encode($response_data));
        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(200);
    });

    //update password
    $app->put('/DrTravelApi/public/updatePassword/{id}',function(Request $request,Response $response,array $args){
        $id=$args['id'];

        if(!haveEmptyParameters(array('currentpassword','newpassword','email'),$request,$response)){
            $request_data=$request->getParsedBody();
            $currentpassword=$request_data['currentpassword'];
            $newpassword=$request_data['newpassword'];
            $email=$request_data['email'];

            $db=new DbOperations;

            $result=$db->updatePassword($currentpassword,$newpassword,$email);

            if($result==PASSWORD_CHANGED){
                $response_data=array();
                $response_data['error']=false;
                $response_data['message']='Password Changed';
                $response->getBody()->write(json_encode($response_data));
                return $response->withHeader('Content-type','application/json')
                                ->withStatus(200);
            }else if($result == PASSWORD_DO_NOT_MATCH){
                $response_data=array();
                $response_data['error']=true;
                $response_data['message']='You have given wrong password';
                $response->getBody()->write(json_encode($response_data));
                return $response->withHeader('Content-type','application/json')
                                ->withStatus(200);
            }else if($result == PASSWORD_NOT_CHANGED){
                $response_data=array();
                $response_data['error']=true;
                $response_data['message']='Some error occurred';
                $response->getBody()->write(json_encode($response_data));
                return $response->withHeader('Content-type','application/json')
                                ->withStatus(200);
            }
        }

        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(422);
    });

    function haveEmptyParameters($required_params,$request,$response){
        $error=false;
        $error_params="";
        $request_params=$request->getParsedBody();

        foreach($required_params as $param){
            if(!isset($request_params[$param])||strlen($request_params[$param])<=0){
                $error=true;
                $error_params.=$param.', ';
            }
        }

        if($error){
            $error_detail=array();
            $error_detail['error']=true;
            $error_detail['message']='Required parameters'.substr($error_params,0,-2).'are missing or empty';
            $response->getBody()->write(json_encode($error_detail));
        }
        return $error;
    }

    $app->run();
?>