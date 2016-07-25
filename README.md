# SinatraAssessmentApplication

## GINWIK

GINWIK is a programs that is meant to organize cultural information according to materialist criteria, such as economic condictions, technological development, and conflicts between social groups.

Unlike a Wiki, it is not meant to be many individuals working to create a single result. Rather, the final result is always meant to be an individual production. Users can incorporate others' work into their own by merging specific information or even cloning an entire entry. But any single entry is the sole possession of a single user, who has exclusive rights to edit or destroy that instance.

### Basic Setup

Before running any of these examples, you should run the below command to make sure that you have the correct ruby gems installed

    `bundle install`

Next, setup the database by running

    `rake db:migrate`

### Running the Application Locally

To run this application locally, cd into the SinatraAssessmentApplication directory that you cloned and run

    `shotgun` 

Or, if that doesn't work

    `bundle exec shotgun` 

Then travel in your browser to

    `localhost:9393`


