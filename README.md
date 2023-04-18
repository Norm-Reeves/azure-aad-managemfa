# azure-aad-managemfa
PowerShell CLI that allows an AAD user with "Authentication Administrator" or “Privileged Authentication Administrator” to read, disable, enable, enforce, bulk enforce, and reset per-user Azure AD Multi-Factor Authentication for a user.

The Miscrosoft GUI for per-user Azure AD Multi-Factor Authentication management is only accessible to "Global Administrators" which would violate principle of least privilege.

We will be moving to Conditional Access in the near future which this script does not apply.

Important to Note:
=========
• PowerShell module "MSOnline" needs to be installed for this script/.exe to work. You can install the module by running the following command in an elevated PowerShell session: ```Install-Module MSOnline```

• Script/.exe does not need to be elevated to work.

Download .exe
=========
https://github.com/Norm-Reeves/azure-aad-managemfa/releases/download/v1.1/manageMfaV1.1.exe

Change Log:
============
1.0:

  • Created base CLI.

1.1:

  • Added bulk enforce (reads .txt file with UPNs on each line).
