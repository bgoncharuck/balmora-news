# balmoranews
Work In Progress

It could be done with the native flutter completely, but we have a requirement:
```YAML
Mandatory Technologies to use
- Bloc(https://pub.dev/packages/flutter_bloc) for state management (use Cubit)
- Dio (https://pub.dev/packages/dio) for services
- get_it for dependency injection (https://pub.dev/packages/get_it)
- JSON serializable (https://pub.dev/packages/json_serializable) for serializing
- Routing with Go router
```

First of all, GetIt is a ServiceLocator which is not context-based and is an anti-pattern. It's not DI.

Next. Since we are required to use flutter_bloc which depends on Provider
We can use connectivity_wrapper which is also depends on Provider, for less code over other approaches.

As it's not a real project, the .env and .build_template are not .gitignored

---

## Entry Screen

![Portrait](images/entry_screen_portrait.png)
![Album](images/entry_screen_album.png)

## News List

- Independent controller from UI variants, separated screen logic
- Initial load and retry
- Internet connection observer
- get new news OR get more older ones on scroll events
- hydrated bloc: mobile state offline cache and FlutterWeb bloc cache
- FPS ~59
- ability to change config of news request (NewsConfig)

![Portrait](images/news_list_screen_portrait.png)
![Album](images/news_list_screen_album.png)

## News Details

Shows all news details available, actions:
- open source link
- copy source link

![Portrait](images/news_details_screen_portrait.png)
![Album](images/news_details_screen_album.png)