<!DOCTYPE html>
<html lang="<?php echo $me->config->main->language ?? 'es'; ?>">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $me->title; ?> | Alxarafe</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link href="/themes/alxarafe/css/alxarafe.css?v=<?php echo e(time()); ?>" rel="stylesheet">

    <?php echo $me->getRenderHeader(); ?>

</head>
<body class="alxarafe-theme">
    <?php
        $_body = 'body_' . ($empty ?? false ? 'empty' : 'standard');
    ?>
    <?php echo $__env->make('partial.' . $_body, \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <?php echo $__env->make('partial.footer', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
</body>
</html>
<?php /**PATH /var/www/html/templates/themes/alxarafe/partial/layout/main.blade.php ENDPATH**/ ?>