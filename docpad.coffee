docpadConfig =
  templateData:
    site:
      author: "John Batte"
      basePath: "/"
      description: """
        Driven, curious, experienced, and always eager for new challenges.
        I'm a software architect and a developer skilled in C#, Ruby, Java, JavaScript, and more.
        """
      email: "jbatte@gmail.com"
      keywords: """
        C#, csharp, Ruby, Java, JavaScript, Hadoop, SDLC, architecture, Batte, profile
        """
      oldUrls: [
        'jbatte47.github.io'
      ]
      links:
        profile: "http://www.linkedin.com/in/codeninja/"
        tribe: "http://tribesoftware.org/"
        comic: "http://icodeinmysleep.com/"
        newRequest: "https://github.com/jbatte47/jbatte47.github.io/issues/new"
        about: "/pages/about"
      twitter:
        id: "john_batte"
        widgetId: "538411913848569857"
      url: "http://johnbatte.me"

    getEmail: ->
      "mailto:#{@site.email}"

    getTwitterUrl: ->
      "https://twitter.com/#{@site.twitter.id}"

    getPreparedTitle: ->
      siteTitle = @site.title || @site.author
      if @document.title
        "#{@document.title} | #{siteTitle}"
      else
        siteTitle

    getPreparedDescription: ->
      @document.description or @site.description

    getPreparedKeywords: ->
      @site.keywords.concat(@document.keywords or []).join(', ')


  collections:
    pages: (database) ->
      database.findAllLive({pageOrder: $exists: true}, [pageOrder:1,title:1])
    posts: (database) ->
      database.findAllLive({relativeOutDirPath:'posts'},[date:-1])


  events:
    serverExtend: (opts) ->
      {server} = opts
      docpad = @docpad
      latestConfig = docpad.getConfig()
      oldUrls = latestConfig.templateData.site.oldUrls or []
      newUrl = latestConfig.templateData.site.url

      server.use (req,res,next) ->
        if req.headers.host in oldUrls
          res.redirect 301, newUrl+req.url
        else
          next()

  environments:
  	development:
  		templateData:
  			site:
  				url: "http://localhost:9778"

module.exports = docpadConfig
