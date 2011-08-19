<body>

<form action='index.php' method='post' name='mainform'>

<div class='logout-box'>
 <h2>{tr}Your GOsa session has expired!{/tr}</h2>

 <p>
 {tr}It has been a while since your last interaction with GOsa took place. Your session has been closed for security reasons. Please login again to continue with administrative tasks.{/tr}
 </p>

 <hr>

 <div class='plugin-actions'>
  <center>
   <button type="submit" name="dummy" id="dummy">{tr}Login again{/tr}</button>
  </center>
 </div>
</div>

</form>

<script language="JavaScript" type="text/javascript">
  $('dummy').focus();
</script>

</body>
</html>
