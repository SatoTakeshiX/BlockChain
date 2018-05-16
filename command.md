# Gethのインストール

## p9

```
$ brew tap ethereum/ethereum
$ brew install ethereum
```

```
$ geth version
Geth
Version: 1.8.2-stable
Architecture: amd64
Protocol Versions: [63 62]
Network Id: 1
Go Version: go1.10
Operating System: darwin
GOPATH=/Users/<user>/go
GOROOT=/usr/local/opt/go/libexec
```


# Gethの初期化、アカウント作成、発掘
## p10

```
$ mkdir tryGeth
$ cd tryGeth/
```

```
$ vim genesis.json
```

```
{
  "config": {
        "chainId": 10,
        "homesteadBlock": 0,
        "eip155Block": 0,
        "eip158Block": 0
    },
  "alloc"      : {},
  "coinbase"   : "0x0000000000000000000000000000000000000000",
  "difficulty" : "0x20000",
  "extraData"  : "",
  "gasLimit"   : "0x2fefd8",
  "nonce"      : "0x0000000000000042",
  "mixhash"    : "0x0000000000000000000000000000000000000000000000000000000000000000",
  "parentHash" : "0x0000000000000000000000000000000000000000000000000000000000000000",
  "timestamp"  : "0x00"
}

```

## p12
```
$ mkdir privateNet
```

```
$ geth --datadir=./privateNet/ init ./genesis.json
```


# プライベートネットワーク起動



## p13

```
$ geth --networkid "10" --nodiscover --datadir "./privateNet/" console 2>> ./privateNet/geth_err.log
```


```
$ geth --networkid "10" --nodiscover --datadir "./privateNet/" console 2>> ./privateNet/geth_err.log
Welcome to the Geth JavaScript console!

instance: Geth/v1.8.2-stable/darwin-amd64/go1.10
coinbase: 0xdb7a613af7a3a1628d9ab30ea4e8dadb13b96e89
at block: 9419 (Sun, 15 Apr 2018 14:47:04 KST)
 datadir: /Users/satoutakeshi/product/Etherum/tryGeth/privateNet
 modules: admin:1.0 debug:1.0 eth:1.0 miner:1.0 net:1.0 personal:1.0 rpc:1.0 txpool:1.0 web3:1.0
>
```
# アカウントの作成、採掘

## p14
コンソール操作

```
> personal.newAccount()
Passphrase:  ## geth_test1を入力
Repeat passphrase: ## geth_test1を入力
"0xdb7a613af7a3a1628d9ab30ea4e8dadb13b96e89"

> eth.accounts
["0xdb7a613af7a3a1628d9ab30ea4e8dadb13b96e89"]

> eth.accounts[0]
"0xdb7a613af7a3a1628d9ab30ea4e8dadb13b96e89"

> miner.start()
null

> eth.mining
true
```

## p15
コンソール操作

```
> web3.fromWei(eth.getBalance(eth.accounts[0]),"ether")
47062

> miner.stop()
true


```
# Gethでプライベートネットワークを起動する
## p16
コマンドライン操作。
`0xdb7a613af7a3a1628d9ab30ea4e8dadb13b96e89`は適宜読み替え

```
$ geth --networkid 10 --nodiscover --unlock "0xdb7a613af7a3a1628d9ab30ea4e8dadb13b96e89" -mine --rpc --rpccorsdomain "*" --datadir ./privateNet console 2>>./privateNet/err.log
```

```
Unlocking account 0xdb7a613af7a3a1628d9ab30ea4e8dadb13b96e89 | Attempt 1/3
Passphrase:
Welcome to the Geth JavaScript console!

instance: Geth/v1.8.2-stable/darwin-amd64/go1.10
coinbase: 0xdb7a613af7a3a1628d9ab30ea4e8dadb13b96e89
at block: 9443 (Sun, 15 Apr 2018 16:33:30 KST)
 datadir: /Users/satoutakeshi/product/Etherum/tryGeth/privateNet
 modules: admin:1.0 debug:1.0 eth:1.0 miner:1.0 net:1.0 personal:1.0 rpc:1.0 txpool:1.0 web3:1.0

>

```

# Remixの起動
## p17 
コマンドライン操作。

```
$ npm install remix-ide -g
```

```
$ remix-ide
setup notifications for /Users/<User>/product/Etherum/tryGeth
Shared folder : /Users/<User>/product/Etherum/tryGeth
Starting Remix IDE at http://localhost:8080 and sharing /Users/satoutakeshi/product/Etherum/tryGeth
Sun Apr 15 2018 17:36:48 GMT+0900 (KST) Remixd is listening on 127.0.0.1:65520
```

p31 プライベートネットワークで実行

```
$ geth --networkid 10 --nodiscover --unlock "0xdb7a613af7a3a1628d9ab30ea4e8dadb13b96e89" -mine --rpc --rpccorsdomain "*" --datadir ./privateNet console 2>>./privateNet/err.log
```
