<?php

/* Copyright (C) 2024       Rafael San José         <rsanjose@alxarafe.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */

namespace Dolibarr\Code\FichInter\Model;

use Carbon\Carbon;
use Dolibarr\Code\Projet\Model\Projet;
use Dolibarr\Code\UserGroup\Model\User;
use Dolibarr\Core\Base\Model;

/**
 * Class FichinterRec
 *
 * @property int $rowid
 * @property string $title
 * @property int $entity
 * @property int|null $fk_soc
 * @property Carbon|null $datec
 * @property int|null $fk_contrat
 * @property int|null $fk_user_author
 * @property int|null $fk_projet
 * @property float|null $duree
 * @property string|null $description
 * @property string|null $modelpdf
 * @property string|null $note_private
 * @property string|null $note_public
 * @property int|null $frequency
 * @property string|null $unit_frequency
 * @property Carbon|null $date_when
 * @property Carbon|null $date_last_gen
 * @property int|null $nb_gen_done
 * @property int|null $nb_gen_max
 * @property int|null $auto_validate
 * @property int|null $status
 *
 * @property Projet|null $projet
 * @property User|null $user
 */
class FichinterRec extends Model
{
    public $timestamps = false;
    protected $table = 'fichinter_rec';
    protected $casts = [
        'entity' => 'int',
        'fk_soc' => 'int',
        'datec' => 'datetime',
        'fk_contrat' => 'int',
        'fk_user_author' => 'int',
        'fk_projet' => 'int',
        'duree' => 'float',
        'frequency' => 'int',
        'date_when' => 'datetime',
        'date_last_gen' => 'datetime',
        'nb_gen_done' => 'int',
        'nb_gen_max' => 'int',
        'auto_validate' => 'int',
        'status' => 'int'
    ];

    protected $fillable = [
        'title',
        'entity',
        'fk_soc',
        'datec',
        'fk_contrat',
        'fk_user_author',
        'fk_projet',
        'duree',
        'description',
        'modelpdf',
        'note_private',
        'note_public',
        'frequency',
        'unit_frequency',
        'date_when',
        'date_last_gen',
        'nb_gen_done',
        'nb_gen_max',
        'auto_validate',
        'status'
    ];

    public function projet()
    {
        return $this->belongsTo(Projet::class, 'fk_projet');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user_author');
    }
}
