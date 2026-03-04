<?php

namespace Modules\Alixar\Controller;

use Alxarafe\Base\Controller\Controller;

class DocumentController extends Controller
{
    public function doView()
    {
        $path = $_GET['path'] ?? '';
        if (empty($path)) {
            die('File not found');
        }

        // Basic security: prevent path traversal
        if (strpos($path, '..') !== false || strpos($path, '/var/documents/') !== 0) {
            die('Access denied');
        }

        $root = defined('ABSPATH') ? constant('ABSPATH') : getcwd();
        $fullPath = $root . $path;

        if (!file_exists($fullPath)) {
            die('File not found at ' . $fullPath);
        }

        $finfo = finfo_open(FILEINFO_MIME_TYPE);
        $mime = finfo_file($finfo, $fullPath);
        finfo_close($finfo);

        header('Content-Type: ' . $mime);
        header('Content-Disposition: inline; filename="' . basename($fullPath) . '"');
        readfile($fullPath);
        exit;
    }
}
