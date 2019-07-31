<!DOCTYPE html>
<html>

<head>
    <title>{{ .title }}</title>
    <style type="text/css">
    /*公共样式*/
    body,
    h1,
    h2,
    h3,
    h4,
    p,
    ul,
    ol,
    li,
    form,
    button,
    input,
    textarea,
    th,
    td {
        margin: 0;
        padding: 0
    }

    body,
    button,
    input,
    select,
    textarea {
        font: 12px/1.5 Microsoft YaHei UI Light, tahoma, arial, "\5b8b\4f53";
        *line-height: 1.5;
        -ms-overflow-style: scrollbar
    }

    h1,
    h2,
    h3,
    h4 {
        font-size: 100%
    }

    ul,
    ol {
        list-style: none
    }

    a {
        text-decoration: none
    }

    a:hover {
        text-decoration: underline
    }

    img {
        border: 0
    }

    button,
    input,
    select,
    textarea {
        font-size: 100%
    }

    table {
        border-collapse: collapse;
        border-spacing: 0
    }

    /*rem*/
    html {
        font-size: 62.5%;
    }

    body {
        font: 16px/1.5 "microsoft yahei", 'tahoma';
    }

    body .mobile-page {
        font-size: 1.6rem;
    }

    /*浮动*/
    .fl {
        float: left;
    }

    .fr {
        float: right;
    }

    .clearfix:after {
        content: '';
        display: block;
        height: 0;
        clear: both;
        visibility: hidden;
    }

    body {
        background-color: #F5F5F5;
    }

    .mobile-page {
        max-width: 600px;
    }

    .mobile-page .admin-img,
    .mobile-page .user-img {
        width: 45px;
        height: 45px;
    }

    i.triangle-admin,
    i.triangle-user {
        width: 0;
        height: 0;
        position: absolute;
        top: 10px;
        display: inline-block;
        border-top: 10px solid transparent;
        border-bottom: 10px solid transparent;
    }

    .mobile-page i.triangle-admin {
        left: 4px;
        border-right: 12px solid #fff;
    }

    .mobile-page i.triangle-user {
        right: 4px;
        border-left: 12px solid #9EEA6A;
    }

    .mobile-page .admin-group,
    .mobile-page .user-group {
        padding: 6px;
        display: flex;
        display: -webkit-flex;
    }

    .mobile-page .admin-group {
        justify-content: flex-start;
        -webkit-justify-content: flex-start;
    }

    .mobile-page .user-group {
        justify-content: flex-end;
        -webkit-justify-content: flex-end;
    }

    .mobile-page .admin-reply,
    .mobile-page .user-reply {
        display: inline-block;
        padding: 8px;
        border-radius: 4px;
        background-color: #fff;
        margin: 0 15px 12px;
    }

    .mobile-page .admin-reply {
        box-shadow: 0px 0px 2px #ddd;
    }

    .mobile-page .user-reply {
        text-align: left;
        background-color: #9EEA6A;
        box-shadow: 0px 0px 2px #bbb;
    }

    .mobile-page .user-msg,
    .mobile-page .admin-msg {
        width: 75%;
        position: relative;
    }

    .mobile-page .user-msg {
        text-align: right;
    }

    /*界面*/
    .interface {
        width: 1000px;
        height: 700px;
    }

    .personnel-list {
        float: left;
        width: 200px;
        height: 500px;
        background-color: #bbbbbb;
        border-style: solid;
        border-color: #000000;
        overflow: scroll;
    }

    /*聊天框*/
    .chat-with {
        float: left;
        width: 600px;
        height: 400px;
        background-color: #bbbbbb;
        border-style: solid;
        border-color: #000000;
        overflow: scroll;
    }

    .send-msg {
        float: left;
        width: 600px;
        height: 100px;
        background-color: #bbbbbb;
        border-style: solid;
        border-color: #000000;
        overflow: scroll;
    }
    </style>
</head>

<body>
    <div class="mobile-page">
        <div class="interface">
            <div class="personnel-list">
                <!-- 在线列表 -->
            </div>
            <div class="chat-with">
                <div class="admin-group">
                    <div class="admin-img">
                        管理员
                    </div>
                    <div class="admin-msg">
                        <i class="triangle-admin"></i>
                        <span class="admin-reply">欢迎加入聊天~</span>
                    </div>
                </div>
            </div>
            <div class="send-msg">
                    <input type="text" name="msg" value="你想要发送的消息" size="35">
                <button>  send </button>
            </div>
        </div>
        <script src="http://91vh.com/js/jquery-2.1.4.min.js"></script>
        <script type="text/javascript">
        function currentTime() {
            let timeStamp = (new Date()).valueOf();

            return timeStamp
        }

        function randomNumber(minNum, maxNum) {
            switch (arguments.length) {
                case 1:
                    return parseInt(Math.random() * minNum + 1, 10);
                    break;
                case 2:
                    return parseInt(Math.random() * (maxNum - minNum + 1) + minNum, 10);
                    break;
                default:
                    return 0;
                    break;
            }
        }


        function sendId() {

            let timeStamp = currentTime();
            let randId = randomNumber(100000, 999999);
            let id = timeStamp + "-" + randId;

            return id
        }

        function msg(name, msg) {
            let html = '<div class="admin-group">' +
                '<div class="admin-img" >' + name + '</div>' +
                // '<img class="admin-img" src="http://localhost/public/img/aa.jpg" />'+
                '<div class="admin-msg">' +
                '<i class="triangle-admin"></i>' +
                '<span class="admin-reply">' + msg + '</span>' +
                '</div>' +
                '</div>';
            return html
        }

        function myMsg(name, msg) {
            let html = '<div class="user-group">' +
                '<div class="user-msg">' +
                '<span class="user-reply">' + msg + '</span>' +
                '<i class="triangle-user"></i>' +
                '</div>' +
                '<div class="user-img" >' + name + '</div>' +
                // '<img class="user-img" src="http://localhost/public/img/cc.jpg" />'+
                '</div>';
            return html
        }


        // 连接webSocket
        ws = new WebSocket("ws://127.0.0.1:8089/acc");

        ws.onopen = function(evt) {
            console.log("Connection open ...");

            // // 连接以后
            // person = prompt("请输入你的名字", "hello-" + currentTime());
            // if (person != null) {
            //     console.log("用户准备登陆:" + person);
            //     ws.send('{"seq":"' + sendId() + '","cmd":"login","data":{"userId":"' + person + '","appId":101}}');
            // }

            person = randomNumber(10000, 99999)
            console.log("用户准备登陆:" + person);
            ws.send('{"seq":"' + sendId() + '","cmd":"login","data":{"userId":"' + person + '","appId":101}}');

            // 定时心跳
            setInterval(heartbeat, 30 * 1000)
        };

        ws.onmessage = function(evt) {
            console.log("Received Message: " + evt.data);
            data_array = JSON.parse(evt.data);
            console.log(data_array);

            $("p").append(" <b>Hello world!</b>");
        };

        ws.onclose = function(evt) {
            console.log("Connection closed.");
        };

        // 心跳
        function heartbeat() {
            console.log("定时心跳:" + person);
            ws.send('{"seq":"' + sendId() + '","cmd":"heartbeat","data":{}}');

        }

        // 点击按钮事件
        $("button").click(function() {
            let msg = $("input[name='msg']").val()
            console.log("button 点击." + msg);
            $(".chat-with").append(myMsg(person, msg));
        });
        </script>
    </div>
</body>

</html>