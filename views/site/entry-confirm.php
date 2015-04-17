<?php
/**
 * Created by PhpStorm.
 * User: fulladr
 * Date: 14.04.2015
 * Time: 19:55
 */

use yii\helpers\Html;
?>
<p>Ви вказали наступну інформацію:</p>

<ul>
    <li><label>Name</label>: <?= Html::encode($model->name) ?></li>
    <li><label>Email</label>: <?= Html::encode($model->email) ?></li>
</ul>