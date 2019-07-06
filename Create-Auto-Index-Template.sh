#create policy
#curl -X PUT "http://localhost:9200/_ilm/policy/tweets_index_policy" -H 'Content-Type: application/json' -d'
#{
#  "policy": {
#    "phases": {
#      "warm": {
#        "min_age": "3d",
#        "actions": {
#         "readonly" : { }
#        }
#      },
#      "delete": {
#        "min_age": "31d",
#        "actions": {
#          "delete": {}
#        }
#      }
#    }
#  }
#}
#'


#create index template
curl -X PUT "http://localhost:9200/_template/active-tweets" -H 'Content-Type: application/json' -d'{
	"template": "tweets-*",
	"settings": {
		"index": {
			"number_of_shards": "8",
			"number_of_replicas": "0"
		}
	},
	"mappings": {
		"doc": {
			"properties": {
				"entities": {
					"properties": {
						"hashtags": {
							"properties": {
								"text": {
									"type": "text",
									"fields": {
										"keyword": {
											"type": "keyword",
											"ignore_above": 256
										}
									}
								}
							}
						},
						"media": {
							"properties": {
								"description": {
									"type": "text",
									"fields": {
										"keyword": {
											"type": "keyword",
											"ignore_above": 256
										}
									}
								},
								"display_url": {
									"type": "text",
									"fields": {
										"keyword": {
											"type": "keyword",
											"ignore_above": 256
										}
									}
								},
								"expanded_url": {
									"type": "text",
									"fields": {
										"keyword": {
											"type": "keyword",
											"ignore_above": 256
										}
									}
								},
								"id": {
									"type": "long"
								},
								"id_str": {
									"type": "text",
									"fields": {
										"keyword": {
											"type": "keyword",
											"ignore_above": 256
										}
									}
								},

								"media_url": {
									"type": "text",
									"fields": {
										"keyword": {
											"type": "keyword",
											"ignore_above": 256
										}
									}
								},
								"source_status_id": {
									"type": "long"
								},
								"source_status_id_str": {
									"type": "text",
									"fields": {
										"keyword": {
											"type": "keyword",
											"ignore_above": 256
										}
									}
								},
								"source_user_id": {
									"type": "long"
								},
								"source_user_id_str": {
									"type": "text",
									"fields": {
										"keyword": {
											"type": "keyword",
											"ignore_above": 256
										}
									}
								},
								"type": {
									"type": "text",
									"fields": {
										"keyword": {
											"type": "keyword",
											"ignore_above": 256
										}
									}
								},
								"url": {
									"type": "text",
									"fields": {
										"keyword": {
											"type": "keyword",
											"ignore_above": 256
										}
									}
								}
							}
						},
						"urls": {
							"properties": {
								"display_url": {
									"type": "text",
									"fields": {
										"keyword": {
											"type": "keyword",
											"ignore_above": 256
										}
									}
								},
								"expanded_url": {
									"type": "text",
									"fields": {
										"keyword": {
											"type": "keyword",
											"ignore_above": 256
										}
									}
								},

								"url": {
									"type": "text",
									"fields": {
										"keyword": {
											"type": "keyword",
											"ignore_above": 256
										}
									}
								}
							}
						},
						"user_mentions": {
							"properties": {
								"id": {
									"type": "long"
								},
								"id_str": {
									"type": "text",
									"fields": {
										"keyword": {
											"type": "keyword",
											"ignore_above": 256
										}
									}
								},

								"name": {
									"type": "text",
									"fields": {
										"keyword": {
											"type": "keyword",
											"ignore_above": 256
										}
									}
								},
								"screen_name": {
									"type": "text",
									"fields": {
										"keyword": {
											"type": "keyword",
											"ignore_above": 256
										}
									}
								}
							}
						}
					}
				},
				"actor_display_name": {
					"type": "keyword",
					"eager_global_ordinals": true
				},
				"original_user_favourites_count": {
					"type": "integer"
				},
				"original_user_followers_count": {
					"type": "integer"
				},
				"original_user_friends_count": {
					"type": "integer"
				},
				"original_user_listed_count": {
					"type": "integer"
				},
				"original_user_statuses_count": {
					"type": "integer"
				},
				"user_favourites_count": {
					"type": "integer"
				},
				"user_followers_count": {
					"type": "integer"
				},
				"user_friends_count": {
					"type": "integer"
				},
				"user_listed_count": {
					"type": "integer"
				},
				"user_statuses_count": {
					"type": "integer"
				},
				"actor_friends_count": {
					"type": "integer"
				},
				"actor_image_url": {
					"type": "keyword"
				},
				"actor_preferred_username": {
					"type": "keyword",
					"eager_global_ordinals": true
				},
				"bdy": {
					"type": "keyword",
					"eager_global_ordinals": true
				},
				"body": {
					"type": "text",
					"fielddata": true,
					"eager_global_ordinals": true
				},
				"generator_display_name": {
					"type": "keyword",
					"fielddata": true,
					"eager_global_ordinals": true
				},

				"lang": {
					"type": "keyword",
					"eager_global_ordinals": true
				},
				"location_twitter_country_code": {
					"type": "keyword",
					"eager_global_ordinals": true
				},
				"original_tweet_id": {
					"type": "keyword",
					"eager_global_ordinals": true

				},
				"original_posted_time": {
					"type": "date",
					"format": "EEE MMM dd HH:mm:ss Z yyyy"
				},
				"original_user_created_at": {
					"type": "date",
					"format": "EEE MMM dd HH:mm:ss Z yyyy"
				},
				"user_created_at": {
					"type": "date",
					"format": "EEE MMM dd HH:mm:ss Z yyyy"
				},
				"posted_time": {
					"type": "date",
					"format": "EEE MMM dd HH:mm:ss Z yyyy"
				},
				"quote_count": {
					"type": "integer"
				},
				"quoted_status_id": {
					"type": "text",
					"eager_global_ordinals": true
				},
				"retweet_count": {
					"type": "integer"
				},
				"original_retweet_count": {
                	"type": "integer"
                },
				"verb": {
					"type": "keyword",
					"eager_global_ordinals": true
				},
				"tweet_id": {
					"type": "keyword",
					"eager_global_ordinals": true
				}


			}

		}

	},
	"aliases": {
		"free_dashboard": {}
	}
}'

