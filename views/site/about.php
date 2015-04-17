<?php
use yii\helpers\Html;

/* @var $this yii\web\View */
$this->title = 'About';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-about">
    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        Це сорінка про нас. Її можна модифікувати як завгодно на власний розсуд:
    </p>

    <code><?= __FILE__ ?></code>
</div>
