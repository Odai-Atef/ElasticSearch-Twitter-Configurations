currentDate=`date +"%Y%m%d"`
yesterdayDate=`date -d "yesterday" +'%Y%m%d'`
dayBeforeDate=`date -d "2 day ago" +'%Y%m%d'`


curl -X POST "localhost:9200/_aliases" -H 'Content-Type: application/json' -d'
{
    "actions" : [
        { "remove" : { "index" : "tweets-'$dayBeforeDate'", "alias" : "free_dashboard" } }
        { "add" : { "index" : "tweets-'$currentDate'", "alias" : "free_dashboard" } },
        { "add" : { "index" : "tweets-'$yesterdayDate'", "alias" : "free_dashboard" } }
    ]
}
'



