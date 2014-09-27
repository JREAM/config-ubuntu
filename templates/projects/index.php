<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Localhost</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <link href='//fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
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
                <h3 class="text-center">Localhost</h3>
            </div>
            <div class="col-md-8">
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

</body>
</html>

