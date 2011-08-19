{if !$warningAccepted}

    <table summary="{tr}Warning message{/tr}" style='width:100%'>
     <tr>
      <td style='padding: 10px;'>{image path='images/warning.png'}</td>
      <td>
        <h3>{tr}Attention{/tr}</h3>
       <p>
        {tr}Modifying properties may break your setup, destroy or mess up your LDAP database, lead to security holes or it can even make a login impossible!{/tr}
        {tr}Since configuration properties are stored in the LDAP database a copy/backup can be handy.{/tr}
       </p>

       <p>
        {tr}If you've debarred yourself, you can try to set 'ignoreLdapProperties' to 'true' in your gosa.conf main section. This will make GOsa ignore LDAP based property values.{/tr}
       </p>

      </td> 
     </tr>
    </table>
    <hr>
      <input type='checkbox' name='warningAccepted' value='1' id='warningAccepted'>
      <label for='warningAccepted'>{tr}I understand that there are certain risks, but I want to modify properties!{/tr}</label>
    <hr>
    <div class="plugin-actions">
        <button name='goOn'>{msgPool type='okButton'}</button> 
    </div>
    <input type="hidden" name="ignore">

{else}

<script language="javascript" src="include/tooltip.js" type="text/javascript"></script>

<div id="mainlist">

  <div class="mainlist-header">
   <p>{$HEADLINE}&nbsp;{$SIZELIMIT}
    {if $ignoreLdapProperties}
    -  <font color='red'>{tr}Ignoring LDAP defined properties!{/tr}</font>
    {/if}
   </p>
   <div class="mainlist-nav">
    <table summary="{$HEADLINE}">
     <tr>
      <td>{$RELOAD}</td>
      <td class="left-border">{$ACTIONS}</td>
      <td class="left-border">{$FILTER}</td>
     </tr>
    </table>
   </div>
  </div>
  {$LIST}
</div>

<script type="text/javascript">
  Event.observe(window,"load",function() {
    $$("*").findAll(function(node){
      return node.getAttribute('title');
    }).each(function(node){
      var test = node.title;

      if($(test)){
          var t = new Tooltip(node,test);
          t.options.delta_x = -150;
          t.options.delta_y = -50;
          node.removeAttribute("title");
      }
    });
  });
</script>

{if !$is_modified}
    <input type="hidden" name="ignore">
{/if}

<div class="plugin-actions">
    <button name='saveProperties'>{msgPool type='applyButton'}</button>
    <button name='cancelProperties' {if !$is_modified} disabled {/if}>{tr}Undo{/tr}</button>
</div>
{/if} 
