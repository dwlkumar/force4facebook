# Installing Force.com for Facebook #
## Abstract ##

This document will assist you in setting up Force.com Sites, the Salesforce Customer Portal and the Force.com for Facebook toolkit.
## Prerequisites ##

The following installation process will install the Force.com for Facebook toolkit and relies on the following items:

  * Eclipse Force.com IDE
  * Installation of Subclipse, a subversion plugin for Eclipse
  * Force.com Sites
  * Salesforce Customer Portal
  * Facebook Developer Application

## Installing Subclipse ##

Follow the instructions here: http://subclipse.tigris.org/install.html

  * Be sure to **uncheck** Integrations containing Buckminster and Subclipse integration for Mylyn during the plugin installation.
  * If this is the first time you've used SVN, please read the supporting documentation that comes with the Subclipse plugin.

## Option 1: Install the Facebook Toolkit as a package ##
  * If your org is a developer org or already has the XMLDom Class, rename or delete it
  * For the base Toolkit Package, navigate to https://login.salesforce.com/?startURL=%2Fpackaging%2FinstallPackage.apexp%3Fp0%3D04tA00000008wVJ
  * Walk through the install steps
  * Start setting up your site following the instructions below

> ### Other Packages ###
  * Toolkit and Facebook Connect for Sites, you can use this package - 	https://login.salesforce.com/?startURL=%2Fpackaging%2FinstallPackage.apexp%3Fp0%3D04tA00000000Y6H

  * Toolkit and Facebook Connect for Canvas Sites, you can use this package - https://login.salesforce.com/?startURL=%2Fpackaging%2FinstallPackage.apexp%3Fp0%3D04tA00000004lOU

## Option 2: Export the Facebook Toolkit from CodeShare ##

Steps to checkout

  1. Create a new project in Eclipse and accept all the defaults.
  1. Go to Window > Open Perspective > Other and select **SVN Repository Exploring**
  1. Add a new repository: http://force4facebook.googlecode.com/svn/branches/force4facebook3_toolkit/
  1. Navigate to force4facebook3/src and right-click the folder.
    1. Go to export and enter the name of your new project when prompted for a project name.
    1. You will be asked to delete and overwrite the existing project. Accept this.
  1. Return to the Force.com IDE perspective and refresh your project to see the Force.com for Facebook items added to the project.
  1. Do the same for the sample application

## Activate Force.com Sites ##

  1. Go to **Setup > Develop > Sites**
  1. Create and register a Force.com Domain
  1. Click **New** to create a new site for this domain
    1. Enter a **Site Label**, such as 'FB Example'
    1. **Site Name** will be autopopulated as <font size='4pt'><code>'FB_Example'</code></font>
    1. Select your user account as a **Site Contact**
    1. Check the **Active** checkbox
    1. Keep the rest of the options on their default settings

## Allowing for Authentication of Users ##

In order to adhere to the Salesforce terms of service, we must use the Salesforce Customer Portal in order to authenticate users, rather than writing our own methods for user authentication.

  1. Go to **Setup > Customize > Customer Portal > Settings**
  1. Click **Edit** and check the **Enable Customer Portal** checkbox
  1. Click **Cancel** to skip the Customer Portal User Wizard
  1. Click **Edit** next to the newly created Customer Portal
    1. Ensure that **Login Enabled** is checked
    1. Set your user account to be the **Administrator User**
    1. Check the **Self-Registration Enabled** checkbox
    1. Set **Default New User License** to 'Customer Portal Manager'
    1. Set **Default New User Role** to 'User'
    1. Set **Default New User Profile** to 'Customer Portal Manager'


## Creating Tabs For Our New Objects ##

  1. Go to **Setup > Create > Tabs**
  1. Click **New** in 'Custom Object Tabs'
    1. Select **GFCUser** as the object
    1. Select any tab style
    1. Click **Next** and make the tab visible only for the 'System Administrator'
    1. Click **Next** and make the tab available only to the 'Force.com' app or any other app of your choosing
    1. Repeat for the **Site Config** object

## Setting up a Facebook Application ##

  1. Go to [Facebook.com](http://www.facebook.com) and login
  1. Add the **Developer** application to your Facebook account
  1. Click on **Setup New Application** within the Developer application
  1. Give it a name. Keep in mind you can't use 'Facebook' or any variation of that word in the name of your application
  1. Make note of your **API Key** and **Secret**, you will need these in Salesforce
  1. Click on the **Connect** item in the sidebar and set your **Connect URL** to the domain of your Force.com Site (http://sitename-developer-edition.na7.force.com)
  1. Click on the **Advanced** menu item and ensure that the **Application Type** is set to 'Web'
  1. Click **Save Changes**

## Setup a Portal User Account ##

  1. Go to the Accounts tab
  1. Create a new account with the name of 'Facebook Portal' and any basic information you desire
  1. Now we must setup role for the owner of the Portal User Account
    1. Click on the Account Owner
    1. Give the User a role. It can be any role.

## Setup the Site Configuration ##

  1. Go to the **Site Config** tab you created earlier
  1. Create a **New** record for 'Site Config'
    1. Enter the **Site Name** as it is found in your Force.com Sites configuration, in this case: <font size='4pt'><code>'FB Example'</code></font>
    1. Enter the **API Key** from your Facebook developer application
    1. Enter your **Facebook Application Secret**
    1. Lookup the **Portal User Account** that you created earlier
    1. **Save** the record

## Setup Remote Site Settings ##

  1. Go to **Setup > Security Controls > Remote Site Settings**
  1. Click **New Remote Site** and enter the following for each field
    1. **Remote Site Name**: FacebookAPI
    1. **Remote Site URL**: http://api.new.facebook.com
    1. Check **Disable Protocol Security**
    1. Click **Save & New**
    1. **Remote Site Name**: FacebookAPISSL
    1. **Remote Site URL**: https://api.new.facebook.com
    1. Leave **Disable Protocol Security** unchecked
    1. **Save** the record

## Setup Proper Permissions For Our Portal Users ##

  1. Go to **Setup > Create > Objects**
    1. Click **Edit** on 'GFC User'
    1. Under _Optional Features_, select the **Available for Customer Portal** checkbox
    1. Repeat for the 'Site Config' object
  1. Go to **Setup > Manage Users > Profiles**
  1. Click on the **Customer Portal Manager** profile so we can grant access to our two new objects
    1. Click the **Clone** on the profile
    1. Enter a new **Profile Name**, such as 'Facebook Portal User'
    1. Click **Edit** on the new 'Facebook Portal User' profile
    1. Scroll down until you see the _Custom Object Permissions_
      1. Set GFC Users to **Read, Create, Edit**
      1. Set Site Configs to **Read**
    1. Return to the 'Facebook Portal User' profile
      1. Click **Edit** on the 'Enabled Visualforce Page Access' related list
      1. Move the following pages over to the **Enabled Visualforce Pages** section: _MyFacebookSiteLogin, MyFacebookSiteTemplate, MyFacebookUnauthorized, MyHomePage, MyOtherProtectedPage, MyProtectedPage, MyFacebookCss, xd\_receiver_
      1. Click **Save**
    1. Now because we cloned the profile, we must go back to the Customer Portal Setup to update the default user profile
      1. Go to **Setup > Customize > Customer Portal**
      1. Click **Edit** on your Customer Portal
        1. Under the _Self-Registration Settings_, change the **Default User Profile** to 'Facebook Portal User'
        1. In the 'Assigned Profiles' related list, click **Edit Profile** and check 'Facebook Portal User'. You can uncheck the old profile

## Setup Login Settings for your Force.com Site ##

  1. Go to **Setup > Develop > Sites**
  1. Click into your Site and click on **Login Settings**
    1. Click **Edit** and change Login to 'Enabled for Customer Portal'
    1. Leave the other settings to their defaults and click **Save**.
  1. Click on the **Public Access Settings** button on your Site to view the Guest License Profile ('FB Example Profile' in this example)
    1. Click Edit and find the _Custom Object Permissions_ section
      1. Check all the boxes for GFC User
      1. Check 'View All' and 'Read' for Site Configs
    1. Edit the Enabled Visualforce Pages
    1. Move the following pages over to **Enabled Visualforce Pages**: _MyFacebookSiteLogin, MyFacebookSiteTemplate, MyFacebookUnauthorized, MyHomePage, MyFacebookCss, xd\_receiver_

## Setup New Facebook Home Page ##

  1. Go to **Setup > Develop > Sites** and click into your Site
    1. Change **Active Site Home Page** to 'MyHomePage'
    1. Change **Site Template** to 'MyFacebookSiteTemplate'

## Whew! That's it! ##

  1. Navigate to your Force.com Site URL and you should see the included example (MyHomePage) load as the home page
  1. Try it out by logging in with Facebook Connect