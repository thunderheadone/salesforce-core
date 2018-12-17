
The VisualForce code contained herein are examples to be used for demonstration purposes and as a baseline for further development. 

See the online help: https://na5.thunderhead.com/one/help/interaction-studio/how-do-i/salesforce/how_do_i_salesforce/

SalesForce Core - Visual Force Pages
====================================

# Installation

## Create Visualforce Pages

After installing the IS SDK for CRM, create a Visualfroce page for each widget.

1. Navigate to `Setup > Visualforce Pages`.
2. Click `New`.
3. Provide a `Label` and *Name for each new page.
    Typically, these will be:
    * Interaction Studio NBA
    * Interaction Studio Customer History
    * Interaction Studio Journey
4. Use sample code provided by us for the Visualforce mark-up. Ensure that your mark-up:
    1. Has the "standardController" parameter set-up as per the object that will contain the widget. For example, Contact.
    2. If you are using a key other than the default "sfdccontactkey", edit the "customerKeyName" parameter.
    3. The "customerKeyName" parameter retrieves the correct identifier from the object where the widget will exist.
    4. Select the `Available for Lightening Experience` check box.

![Installation][installation]

## Create Data Adapters

### Customer History
Navigate to the External Data tab under Collect in the main navigation bar. Select the Customer History Data Adapter and provide it with a name.
![customerHistoryDA][customerHistoryDA]
Next, click "Test Configuration" and after success has appeared click apply, then save. 
![createCustomerHistoryDa][createCustomerHistoryDA]

### customer Journey Status
Navigate to the External Data tab under Collect in the main navigation bar. Select the Customer Journey Status Data Adapter and provide it with a name.
![customerJourneyStatusDA][customerJourneyStatusDA]
Next, click save.

## Create Pull Data Structures

### History Structure

|history| | | |
|-|-|-|-|
|    |entries|         |{Customer History Data Adapter Name}|
|    |    |touchpoint          |Touchpoint name|
|    |    |action              |Action name|
|    |    |actionType          |Activity Type|
|    |    |timestamp           |Timestamp|
|    |    |session             |Session Id|
|    |    |viewOrClick         |View or click|
|    |    |interaction         |Interaction name|
|    |    |recognitionStatus   |Recognition Status|
|    |    |proposition         |Proposition name|
|    |    |activityType        |Activity Type|
|    |    |completion          |Completion Activity|
|    |    |occurrences         |Event count|
|    |    |lifecycleStage      |Lifecycle Stage|
|    |propositions|    |propositions       |
|    |    |prop_name           |Proposition name|
|    |    |interest            |Cumulative diminished count|
|    |    |interest_total      |Total diminished count|

### Devices Structure
|devices| | | |
|-|-|-|-|
|    |entries|         |Recent Devices
|    |    |deviceCategory      |Device category|
|    |    |lastUsed            |Device last used|
|    |    |city                |City the Device is located in|
|    |    |appName             |App name|
|    |    |appVersion          |App version|
|    |    |deviceOS            |Device OS|
|    |    |deviceVersion       |Device OS version|
|    |    |country             |Country the Device is located in|
|    |    |locationAccuracy    |Location accuracy|
|    |    |firstUsed           |Device first used|
|    |    |locationLastUpdate  |Device location last updated|
|    |    |currentDevice       |Is current Device|

### SCJ Structure - Config
|Configuration| | |
|-|-|-|
|    |lifecyclestage      |"{lifecycle},{stages},{comma},{seperated}"|
|    |title               |"Single Customer Journey"|
|    |emptyText           |"There is no customer data to display"|

### SCJ Structure - data
|SingleCustomerJourney| | | |
|-|-|-|-|
|    |journeys|        |Customer Journey Status|
|    |    |propositionName             |Proposition name|
|    |    |currentLifecycleStageStatus |Current journey status|
|    |    |currentLifecycleStage       |Current Lifecycle Stage|
|    |    |lastInteractionDate         |Most recent interaction date|
|    |    |earliestLifecycleStage      |Earliest Lifecycle Stage reached|
|    |    |furthestLifecycleStage      |Furthest Lifecycle Stage reached|

## Customer History Widget

The Interaction Studio Customer History widget allows you to see and filter the customers activity. 

### Setup

This widget uses the Customer History Data Adapter in IS, and requires you to set up the history Structure.

You are also required to provide an object mapping touchpoints to channels.

```javascript
window.channel = {
    web:["Banking Web Site"],
    mobile:["Customer First iOS app","Mobile iOS Banking"],
    email:["Email"],
    assisted:["CallCenter"],
    physical:["Banking System","Branch","Localz Branch"],
    social:["Facebook","Twitter"]
}
```

### How to Use

The widget allows you to filter by:
* channel - A series of checkboxes will appear in the top right cornor, showing those channels which exist. When you check or uncheck a box those entries with the associated channel will be shown/hidden respectively
* Lifecycle Stage - Buttons above the middle of the table will show the Lifecycle Stages specified in the SCJ Configuration Structure along with:
    * other - Those Activity Types that aren't associated with a Lifecycle Stage
    * clear - Remove any filtering and show all Interactions
* Search Term - This allows you to search by any column in the table, displaying an entry if it contains the search term in 1 of its columns

![Customer History][customerHistory]

## Customer Journey Widget

The Interaction Studio Journey widget shows...

### Setup

### How to Use

## Next Best Action

### Setup

### How to Use

## Customer Interest - Treemap

### Setup

### How to Use

## Customer Interest Score

### Setup

### How to Use



[installation]:images/installation.PNG
[customerHistory]:images/CustomerHistory.PNG
[customerHistoryDA]:images/CustomerHistoryDA.png
[createCustomerHistoryDA]:images/CreateCustomerHistoryDA.png
[customerJourneyStatusDA]:images/CustomerJourneyStatusDA.png
