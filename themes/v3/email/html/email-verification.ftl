<html>
  <body>
    <div id='logo' class='logo-container'>
      <img src="${url.resourcesUrl}/img/logo.png" style="height: 60px; width: 120px;" />
    </div>
    ${kcSanitize(msg("emailVerificationBodyHtml",link, linkExpiration, realmName, linkExpirationFormatter(linkExpiration)))?no_esc}
  </body>
</html>
