<html>
  <body>
    ${kcSanitize(msg("passwordResetBodyHtml", link, linkExpiration, realmName, linkExpirationFormatter(linkExpiration), user.email))?no_esc}
  </body>
</html>
