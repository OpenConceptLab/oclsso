<html>
  <body>
    <div id='logo' class='logo-container'>
      <img src="${url.resourcesUrl}/img/favicon.svg" style="height: 60px; width: 120px;" />
    </div>
    ${kcSanitize(msg("passwordResetBodyHtml", link, linkExpiration, realmName, linkExpirationFormatter(linkExpiration), user.email))?no_esc}
  </body>
</html>
