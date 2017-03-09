<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Localhost</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href='//fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha256-/SIrNqv8h6QGKDuNoLGA4iret+kyesCkHGzVUUV0shc=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script>

    </script>
    <style>
    body {
        padding-bottom: 20px;
        font-family: Roboto, arial, sans-serif;
    }

    @media (min-width: 768px) {
        .container {
            max-width: 730px;
        }
    }
    .header {
        background: #2a6496;
        padding-top: 20px;
    }
    .header h3 {
        padding-bottom: 12px;
        margin-top: 0;
        margin-bottom: 0;
        line-height: 40px;
        color: #fff;
    }
    .intro {
        background: #f9fbfb;
        padding: 15px;
        margin-bottom: 15px;
    }
    .intro p {
        margin-bottom: 0;
    }
    .btn-default, .btn-default:hover, .btn-default:focus, .btn-default:active, .btn-default.active, .open>.dropdown-toggle.btn-default {
        border: none !important;
    }
    .directory li {
        font-size: 18px;
        margin-bottom: 5px;
    }
    .directory li a {
        padding: 2px 10px;
    }
    .directory li a:hover {
        background: #2a6496;
        color: #fff;
        text-decoration: none;
    }
    .directory li a.file {
        color: #7f8c8d;
    }
    .directory li a.file:hover {
        background: #7f8c8d;
        color: #fff;
    }
    </style>
</head>
<body>

    <div class="header">
    <div class="container">
            <div class="col-md-4">
                <h3 class="text-center"><b>local</b>host</h3>
            </div>
            <div class="col-md-8">

                <button type="button" class="btn btn-default btn-sm pull-right" data-toggle="modal" data-target="#apache-modal">
                    Apache VHost Help
                </button> |
            </div>
    </div>
    </div>

    <div class="intro">
        <div class="container">
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <ul class="list-unstyled directory">
                <?php
                $dir = new DirectoryIterator(dirname(__FILE__));
                $types = [
                    'dir' => [],
                    'file' => []
                ];

                foreach ($dir as $fileinfo)
                {
                    if ($fileinfo->isDot()) {
                        continue;
                    }

                    if (is_dir($fileinfo->getFilename())) {
                        $types['dir'][] = "<li><a class='dir' href='{$fileinfo->getFilename()}'><span class='glyphicon glyphicon-folder-close'></span> {$fileinfo->getFilename()}</a></li>";
                        continue;
                    }
                    if ($fileinfo->getType = 'file') {
                        $types['file'][] = "<li><a class='file' href='{$fileinfo->getFilename()}'><span class='glyphicon glyphicon glyphicon-file'></span> {$fileinfo->getFilename()}</a></li>";
                        continue;
                    }
                }

                foreach ($types as $type)
                {
                    sort($type);
                    // List Directories and Files
                    foreach ($type as $section) {
                        echo $section;
                    }
                }

                ?>
                </ul>
            </div>
        </div>
    </div>

<div class="modal fade" id="apache-modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Apache VirtualHost Setup</h4>
      </div>
      <div class="modal-body">

            <p>
            If you'd like to setup a VirtualHost other than this one, follow these simple
            instructions.
            </p>

            <ol>
                <li>First, make the folder where your project(s) will live.</li>
                <li>I'll use an example: <code>mkdir -p /var/www/<b>unicorn</b></code></li>
                <li>Next, we have to create a VirtualHost, you should name it something like your project folder.
                <li><code>sudo vim /etc/apache2/sites-available/<b>unicorn.conf</b></code></li>
            </ol>

<pre>
&lt;VirtualHost *:80&gt;
    ServerName <b>unicorn</b>
    DocumentRoot "<b>/var/www/unicorn</b>"
&lt;/VirtualHost&gt;

&lt;Directory <b>/var/www/unicorn</b>&gt;
    Options Indexes FollowSymLinks MultiViews
    AllowOverride All
    Require all granted
&lt;/Directory&gt;
</pre>

            <ol>
                <li>Enable the site with <code>sudo a2ensite unicorn.conf</code></li>
                <li>Make sure your directory exists before restarting, otherwise errors occur.</li>
                <li>Activate the site with <code>sudo service apache2 restart</code></li>
            </ol>

            <h4>Edit Hosts File</h4>

            <ul>
                <li>Lastly, edit the hosts file: <code>sudo vim /etc/hosts</code> and append <b>unicorn</b></li>
            </ul>

<pre>
; It should look like this:
127.0.0.1 localhost projects <b>unicorn</b>
</pre>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


</body>
</html>

