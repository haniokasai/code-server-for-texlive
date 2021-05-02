### replce
- portの設定
    - 外部と内部のポートが一致しないといけない
        - run時にenvを使うことにしよう
#### server.js
    - this.httpServer.listen(viewerPort, '127.0.0.1', undefined, () => {
        - to
        - this.httpServer.listen(viewerPort, '0.0.0.0', undefined, () => {

#### viewer.js
##### 以下のコードを消す

```js
    if (e.origin !== 'http://localhost:${this.extension.server.port}') {
                    return;
                }
```

##### 以下を何でも受け付けるようにする
```html
<!DOCTYPE html><html><head><meta http-equiv="Content-Security-Policy" content="default-src http://localhost:* http://127.0.0.1:*; script-src 'unsafe-inline'; style-src 'unsafe-inline';"></head>
```

http://* https://*

##### urlを書き換える #1 
```htmlembedded=
const origUrl = `http://localhost:${this.extension.server.port}/viewer.html?incode=1&file=${utils_2.encodePathWithPrefix(pdfFile)}`;

```

```
http://localhost:${this.extension.server.port}
```

を
```
location.protocol + `//` + location.host
```

##### urlを書き換える #2
```
const url = `http://localhost:${this.extension.server.port}/viewer.html?file=${utils_2.encodePathWithPrefix(pdfFile)}`;

```
を
```
const url = `location.protocol + `//` + location.host/viewer.html?file=${utils_2.encodePathWithPrefix(pdfFile)}`;
```

- viewer.html
##### 以下を何でも受け付けるようにする

```
    <meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self' 'unsafe-eval'; connect-src 'self' ws://localhost:* ws://127.0.0.1:*; style-src 'self' 'unsafe-inline'; img-src 'self' data: blob:;">

```

```
ws://localhost:* ws://127.0.0.1:*;
```
を
```
ws://*; 
```

## TODO 
- pdfにパスワード認証をかける