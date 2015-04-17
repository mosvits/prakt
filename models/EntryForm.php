<?php
/**
 * Created by PhpStorm.
 * User: fulladr
 * Date: 14.04.2015
 * Time: 19:43
 */

namespace app\models;

use yii\base\Model;

class EntryForm extends Model
{
    public $name;
    public $email;

    public function rules()
    {
        return [
            [['name', 'email'], 'required'],
            ['email', 'email'],
        ];
    }
}

?>