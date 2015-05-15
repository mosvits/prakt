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
    public $speciality_id;
    public $group_id;

    public function rules()
    {
        return [
            //[['name', 'email'], 'required'],
            [['speciality_id','group_id'], 'integer'],//
        ];
    }
}

?>