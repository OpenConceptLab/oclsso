# oclsso
OCL SSO configuration and implementation


### Realm Settings:
- Login:
  - User registration: on
  - Forgot Password: on
  - Verify email: on
  - Login with email: on
- Email:
  - SMTP settings for sending out mails from KeyCloak for verify-email/forgot-password.
- Tokens:
  - Access Token Lifespan as per needed

### Client Settings:
- Settings:
  - Access Type: confidential
  - Standard Flow Enabled: on
  - Implicit Flow Enabled: on
  - Direct Access Grants Enabled: on
  - Valid Redirect URIs: Client URIs, for example -- https://api.dev.openconceptlab.org/* and https://app.dev.openconceptlab.org/*
  - Web Origins: TermBrowser URI -- http://app.dev.openconceptlab.org/*
  - Authentication Flow Overrides:
    - Browser Flow: browser
    - Driect Grant Flow: direct grant
- Credentials:
  - Client Authenticator: Client Id and Secret
- Scope:
  - Full Scope Allowed: on

## The OCL Digital Public Good

This repository is not part of the [OCL Digital Public Good](https://github.com/OpenConceptLab/.github/blob/main/DIGITAL-PUBLIC-GOOD.md). That page lists the repositories that are.
