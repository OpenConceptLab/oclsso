<html>
  <body>
    <div style='background-color:#F6F2F7;padding:24px;font-size:14px;'>
    <div style="padding:16px;background-color:#fff;border-radius:10px;box-shadow:0 4px 4px 0 rgba(0, 0, 0, 0.25);-webkit-box-shadow:0 4px 4px 0 rgba(0, 0, 0, 0.25);">
    ${kcSanitize(msg("emailVerificationBodyHtml",link, linkExpiration, realmName, linkExpirationFormatter(linkExpiration)))?no_esc}
      </div>
    <div style="color:#B7B8BE;margin-top:16px;text-align:center;">
      © 2024 Open Concept Lab
    </div>
    </div>
  </body>
</html>
