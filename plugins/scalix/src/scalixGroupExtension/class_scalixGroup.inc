<?php

class scalixGroup extends scalixAccount
{
    var $scalixGroup = TRUE;

    var $attributes           = array("scalixMailnode");
    var $fakeBooleanAttributes= array("scalixHideUserEntry");
    var $objectclasses        = array("scalixGroupClass");


    static function plInfo()
    {
        return (array(
                    "plDescription"     => tr("SCALIX account"),
                    "plSelfModify"      => TRUE,
                    "plDepends"         => array("group"),
                    "plPriority"        => 2,
                    "plSection"         => array("administration"),
                    "plCategory"        => array("groups"),
                    "plOptions"         => array(),

                    "plProvidedAcls"  => array(

                        "scalixMailnode"            => tr("SCALIX Mail node"),
                        "scalixMailboxClass"        => tr("Mailbox class"),
                        "scalixServerLanguage"      => tr("Server language"),
                        "scalixAdministrator"       => tr("Administrator"),
                        "scalixMailboxAdministrator"=> tr("Mailbox administrator"),
                        "scalixHideUserEntry"       => tr("Hide user entry in SCALIX"),
                        "scalixLimitMailboxSize"    => tr("Mailbox size limitations"),
                        "scalixLimitOutboundMail"   => tr("Limit outbound"),
                        "scalixLimitInboundMail"    => tr("Limit inbound"),
                        "scalixLimitNotifyUser"     => tr("Notify user"),
                        "scalixEmailAddress"        => tr("SCALIX email addresses"))

                        ));
    }
}

// vim:tabstop=2:expandtab:shiftwidth=2:filetype=php:syntax:ruler
?>
