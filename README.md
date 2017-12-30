## PIVX Install Shell

![alt text](https://chainz.cryptoid.info/logo/pivx.png)

## Commands

```sh
#install wallet

git clone https://github.com/MinseokOh/pivx_qtbuild.git
cd pivx_qtbuild
bash pivx.sh install

#run wallet 

cd pivx_qtbuild
bash pivx.sh run

#stop wallet

cd pivx_qtbuild
bash pivx.sh stop

$update wallet

cd pivx_qtbuild
bash pivx.sh update
```

## Edit conf

Open conf file 
```sh
vi ./.pivx/pivx.conf
```

Paste conf
```sh
rpcuser=[rpcusername]
rpcpassword=[rpcpassword]
rpcallowip=127.0.0.1
daemon=1
server=1
listen=1
masternode=1
masternodeprivkey=[masternodegenkey]
externalip=[serverip]
```

that's all! enjoy masternode 
