
#!/bin/bash

sudo yum install -y httpd

HOSTNAME=$(hostname)
INDEX_HTML=$(cat <<-END
<html>

<head>
    <title>Playground</title>
</head>

<body>
    <h1>
        <center>$HOSTNAME</center>
    </h1>
    <br>
    <center><img src="https://conocimientolibre.mx/wp-content/uploads/2019/11/Ansible-AWS-660x320.png" alt="Smiley face"
            height="85%" width="90%"></center>
</body>

</html>
END
)

sudo echo $INDEX_HTML > /var/www/html/index.html

sudo service httpd start
