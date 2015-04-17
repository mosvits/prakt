<?php
/**
 * Created by PhpStorm.
 * User: fulladr
 * Date: 14.04.2015
 * Time: 19:54
 */

use yii\helpers\Html;
use yii\widgets\ActiveForm;
?>
<?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'name')->label('Ваше ім’я') ?>

    <?= $form->field($model, 'email')->label('Ваш email') ?>

    <div class="form-group">
        <?= Html::submitButton('Надіслати', ['class' => 'btn btn-primary']) ?>
    </div>

<?php ActiveForm::end(); ?>