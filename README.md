# football

An application to access football-data.org's free API 
- show scores for games with ability to hide spoilers for selected games
- favourite teams to show these in feed
- check tables of favourited competitions/teams in that competition
- use appropriate tests



## First Step
- create a screen that reads from api and shows scores for Bundesliga games
- use api to return all matches for bundesliga match day 22
- display all returned as a list view (use a builder?)

## Step two 
- think about architecture
    - Call and store in DB or call directly from API (note limited number of calls available, what of live updates)
    - What features are required? Do user stories, from this find features and make wireframes
    - make MVP
