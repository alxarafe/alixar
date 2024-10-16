<?php

/* Copyright (C) 2024      Rafael San José      <rsanjose@alxarafe.com>
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

namespace Dolibarr\Code\Contact\Trait;

trait Mailing
{
    /**
     *  Set "blacklist" mailing status
     *
     * @param bool $no_email 1=Do not send mailing, 0=Ok to receive mailing
     *
     * @return int                 Return integer <0 if KO, >0 if OK
     * @throws Exception
     */
    public function setNoEmail(bool $no_email): int
    {
        if (!$this->email) {
            dol_syslog('Called to Mailing::setNoEmail with no email');
            return 0;
        }

        $entities = [getEntity('mailing', 0)];
        $this->no_email = $no_email;

        if ($no_email) {
            dol_syslog('setNoEmail: unsubscribeEmails(' . $this->email . ')');
            return MailingUnsubscribe::unsubscribeEmail($this->email, $entities);
        }

        dol_syslog('setNoEmail: subscribeEmail(' . $this->email . ')');
        MailingUnsubscribe::removeUnsubscriptionEmail($this->email, $entities);
        return 1;
    }

    /**
     *  get "blacklist" mailing status
     *  set no_email attribute to 1 or 0
     *
     * @return bool                 Return integer <0 if KO, >0 if OK
     * @throws Exception
     */
    public function getNoEmail(): bool
    {
        if (!$this->email) {
            dol_syslog('Called to Mailing::getNoEmail with no email');
            return false;
        }
        $found = MailingUnsubscribe::unsubscribedEmail($this->email, [getEntity('mailing', 0)]);
        dol_syslog('getNoEmail ' . $this->email . ': ' . ($found ? '' : 'NOT ') . 'subscribed!');
        if ($found) {
            $this->no_email = true;
            return true;
        }

        $this->no_email = false;
        return false;
    }
}
