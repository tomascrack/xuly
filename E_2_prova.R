#E
getwd()

# #Desbloquejar aquesta part per compilar desde libreries fins a DataFinalFactor1
#source("libraries.R")
#load( "Work_Space_CEO.RData")
# DataFinal$ANY_ENQUESTA <- provabind2$ANY_ENQUESTA
# DataFinal$Nº_ENQUESTA <- provabind2$Nº_ENQUESTA
# DataFinalFactor  <- glimpse(DataFinal %>% mutate_if(is.labelled,to_factor) )
# DataFinalFactor1 <- glimpse(DataFinal %>% mutate_if(is.labelled,to_character))

#produira fer un reactive de DataFinalFactor-1


#No desbloquejar:
##############################################################################
# source("src/libraries.R")
# load( "data/DATASETS_FINALS.RData")
#load( "data/Datasets_CEO_2.RData")
#load( "Work_Space_CEO.RData")
#shinyUI ( fluidPage ( theme = shinytheme ( " cerulean ")
#getwd()
#names(provabind2)
#table(provabind2$ANY_ENQUESTA)
#table(provabind2$Nº_ENQUESTA)
#DataFinal$ANY_ENQUESTA<-provabind2$ANY_ENQUESTA
#DataFinal$Nº_ENQUESTA<-provabind2$Nº_ENQUESTA
#table(DataFinal$ANY_ENQUESTA)
#DataFinalFactor  <- glimpse(DataFinal %>% mutate_if(is.labelled,to_factor) )
#DataFinalFactor1 <- glimpse(DataFinal %>% mutate_if(is.labelled,to_character))
#names(DataFinalFactor1)
######################################################################################
#runApp(display.mode = "showcase")

ui <-   
  ##Pag1
  
  navbarPage(theme = "bootstrap.min.css",title = "Inici",
             tabPanel("Com és l'app", 
                      titlePanel("Gràfics amb dades del CEO"),
                      fluidRow(
                        column(4,h2('Que és el CEO?'),offset = 1,
                               p('El Centre d’Estudis d’Opinió és l’òrgan de referència en l’àmbit de la Generalitat de Catalunya 
                                                 en allò referent als estudis d’opinió pública.Més informació als enllaços següents:'),
                               selectInput('website', "Enllaç a la pàgina d'interès"
                                           , list("CEO" = "http://ceo.gencat.cat/ca/ceo/que-es-i-que-fa/"
                                                  
                                                  ,"Matriu de dades del CEO" = "http://ceo.gencat.cat/ca/barometre/matrius-fusionada-BOP/"
                                                  ,"Baròmetre" = "http://ceo.gencat.cat/ca/barometre/"
                                                  ,"EvoluCEO" = "http://evoluceo.ceo.gencat.cat/ceo/inici/evoluceo.html#/main"
                                                  ,"UpCEO" = "http://upceo.ceo.gencat.cat/ceoa/AppJava/OperacionsExtern.do"
                                                  ,"google" = "http://www.google.com")
                               ),
                               htmlOutput("mySite"),
                               p("Seleccionar per més explicacions:")
                               ,
                               radioButtons("radio", label = h3("Seleccionar explicacions complementàries:"),
                                            choices = list("Matriu de dades del CEO" = "1",
                                                           "Baròmetre" = "2",
                                                           "EvoluCEO" = "3" ),
                                            selected = 1),
                               
                               textOutput(outputId = "TextPartsCEO" ),
                               textOutput(outputId = "TextPartsCEO2" ),
                               textOutput(outputId = "TextPartsCEO3" )
                        ),
                        
                        
                        
                        column(6,h2('Quins gràfics són útils per dades del CEO ?:'),offset = 1,
                               p('Alguns gràfics útils per variables categòriques'),
                               selectInput('Grafic1',"Diversos gràfics",
                                           list("Pie chart" = "PChart1",
                                                "Bar chart" = "Barchart1",
                                                "Taula de Freqüències" = "TauFreq1")),
                               #plotOutput("grafics1"),
                               #plotOutput("grafics2"),
                               DT::dataTableOutput("grafics3"),
                               #plotOutput("grafics3"))
                               
                        
                               plotOutput("grafics1"))
                        #verbatimTextOutput(outputId = "TextPartsCEO" ))
                      ),
                      fluidRow(
                        # column(4,h1('Selecció del Dataset a Observar'),offset = 1,
                        #        sliderInput("nrows",
                        #                    "Number of rows:",min = 1,max = 8,value = 4)),
                        column(8,h2('Selecció del Dataset'),offset = 1,
                               selectInput(
                                 "BasesCEO", "Tria veure les Bases utilitzades",
                                 choices = list("Base de dades 1 original CEO" = "mydata1",
                                                "Base de dades 2 original CEO" = "mydata2",
                                                "Base fusionada i seleccionada" = "DataFinal")),
                               p('A continuació es mostra en forma de taula DT el Dataset seleccionat.'),
                               DT::dataTableOutput("RawData")))
                      
             ),#aquesta coma, separa el tabPanel 1 del 2
             #esta dins del Tabsetpanel
             
             ##pag2
             ################################ codi anterior##################
             # 
             tabPanel("Pie Chart 1 variable",
                      titlePanel("Pie Chart amb 1 variable"),
                        # Show a plot of the generated distribution
                      sidebarLayout(
                        sidebarPanel(
                          selectInput("Pie1",label = "Pie Chart",
                                      #h4("Selecciona una variable pel grafic Pie Chart:"),
                                      choices = c(names(DataFinalFactor1[c(1:13)]))),
                          #choices = c(names(DataFinalFactor[c(1:13)]))),
                          
                          #selectInput("pType",label = "Gràfic ggplot o ploty:",
                                   #   h4("Selecciona una variable pel grafic Pie Chart:"),
                                    #  choices = c("ggplot","ploty"))
                        
                           radioButtons("pType", "Gràfic ggplot o ploty:",
                                        list("ggplot", "ploty","Tots dos"))),
                          
                      # mainPanel( plotOutput("distPlot1a"),
                      #            plotlyOutput("distPlot1b")
                      mainPanel( 
                        column(6,plotOutput("distPlot1a")),
                                 column(6,plotlyOutput("distPlot1b"))
                          #tabsetPanel(type = "tabs",
                                 # tabPanel("Gràfic 1",
                                   
                                   # Application title
                                  # titlePanel("Pie Chart amb 1 variable"),
                                   
                                   # Sidebar with a slider input for number of bins
                                   # sidebarLayout(
                                   #   sidebarPanel(
                                   #     selectInput("Pie1",label = "Pie Chart",
                                   #                 h4("Selecciona una variable pel grafic Pie Chart:"),
                                   #                 choices = c(names(DataFinalFactor1[c(1:13)]))),
                                   #     #choices = c(names(DataFinalFactor[c(1:13)]))),
                                   #     
                                   #     selectInput("pType",label = "Gràfic ggplot o ploty:",
                                   #                 #h4("Selecciona una variable pel grafic Pie Chart:"),
                                   #                 choices = c("ggplot","ploty"))           
                                       # radioButtons("pType", "Gràfic ggplot o ploty:",
                                       #              list("ggplot", "ploty"))
                                     # ),
                                     
                                     # Show a plot of the generated distribution
                                   #   mainPanel(
                                   #     plotOutput("distPlot1a"),
                                   #     plotOutput("distPlot1b")
                                   #   )
                                   # )
                          )
                      )),
              tabPanel("Bar Chart 1 variable",
                                   # Application title
                                   titlePanel("Bar Chart amb 1 variable"),
                                   # Sidebar with a slider input for number of bins
                                   sidebarLayout(
                                       sidebarPanel(
                                       selectInput("Bar1",label = "Bar Chart",
                                                   h4("Selecciona una variable pel grafic Bar Chart:"),
                                                   choices = c(names(DataFinalFactor[c(1:13)])))
                                       
                                       #radioButtons("pType2", "Gràfic ggplot o no:",
                                        #            list("ggplot"))
                                     ),# Show a plot of the generated distribution
                                     mainPanel(
                                       plotOutput("distPlot2a")
                                       #plotlyOutput("distPlot2b")
                                     )
                                     
                                   )),
            tabPanel("Taula freqüències 1 variable",
                                   # Application title
                                   titlePanel("Taula de freqüències amb 1 variable"),
                                   # Sidebar with a slider input for number of bins
                                   sidebarLayout(
                                     sidebarPanel(
                                       selectInput("Freq1",label = "Taula de Frequencies",
                                                   h4("Selecciona una variable pel grafic Bar Chart:"),
                                                   choices = c(names(DataFinalFactor1[c(1:13)])))
                                     ),
                                     
                                     # Show a plot of the generated distribution
                                     mainPanel(
                                       dataTableOutput("distPlot3a")
                                       #tableOutput("distPlot3b")
                                       
                                     )
                                   )),
          tabPanel("Pie Chart per any",
                                   # Application title
                                   titlePanel("Pie chart segons l'any"),
                                   # Sidebar with a slider input for number of bins
                                   sidebarLayout(
                                     sidebarPanel(
                                       selectInput("PieDos",label = "Pie chart ",
                                                   h4("Selecciona una variable pel grafic Pie chart:"),
                                                   choices = c(names(DataFinalFactor1[c(1:13)]))),
                                       selectInput("PieTres",label = "Pie chart ",
                                                   h4("Selecciona un any pel grafic Pie chart:"),
                                                   choices = c("2006","2007","2008","2009","2010",
                                                               "2011","2012","2013","2014","2015",
                                                               "2016","2017","2018"))
                                     ),
                                     mainPanel(
                          #tableOutput("distPlotPie2")
                                       plotOutput("distPlotPie2")
                                              )
                          )
                      ),
  #)),
             
             #          sidebarLayout(
             #            sidebarPanel(),
             #            mainPanel(
             #              dataTableOutput(outputId = "RawData2")
             #            )
             #          )),
             # #ara vull crear un sidebar on pugui elegir una variable i representarla
             # 
             ##Pag3
          tabPanel("Mosaic plot 2 variables",
                      titlePanel("Mosaic plot 2 variables"),
                      sidebarLayout(
                        sidebarPanel(
                          selectInput("mosaic1",label = "Mosaic plot 1 variable",
                                      h4("Selecciona una variable :"),
                                      #data = DataFinalFactor)
                                      choices = c(names(DataFinalFactor[c(1:13)]))),
                          #selectInput(inputId = "OneVar", label= "Seleccio de Variable",
                          #            choices = c(names(provabind2[c(5,8:19)]),"IBM"= "IBM","Cisco"="CSCO")),
                          #helpText("Nota: De totes les variables seleccionades hem agafat
                          #        que les mes interesants a lhora de representar i de fer-lis
                          #        un grafic a nivell individual."),
                          selectInput("mosaic2",label = "Mosaic plot 2 variable",
                                      h4("Selecciona una variable pel grafic Mosaic:"),
                                      choices = c(names(DataFinalFactor[c(2:13)])))
                          #h4("Vista preliminar de les dades abans gràfics ?"),
                          #actionButton("update", "Si vull veure")


                        ),
                        mainPanel(
                          #tableOutput(outputId = "VarTable"),
                          plotOutput("plotMosaic")#, click = "plot_click"
                          #plotOutput("grafico3")
                          #tableOutput("plotMosaic")
                        )
                      ))
             # 
             ##################################codi anterior###################
             
             
             
             
  )#el ke tanca el navbarPage


server <- function(input, output) {
  
  #options(DT.options = list(pageLength = 5, language = list(search = 'Filter:')))
  
  #Pag1
  
  #Buscar les direccions webs:
  output$mySite <- renderUI({
    tags$a(href = input$website, input$website)
  })
  
  #Treure mes text explicatiu sobre els apartats del CEO
  output$TextPartsCEO <- renderText({
    
    if (input$radio == "1") {
      "Les matrius de dades del CEO són dos, la primera era telefònica de 62.000 observacions i 533 variables i la segona presencial amb 23338
      observacions i 856 variables amb dades entre els anys 2006-2019."
    } })
  
  output$TextPartsCEO2 <- renderText({ 
    if (input$radio == "2") {
      "El Baròmetre és una enquesta regular que fa el CEO sobre qüestions socials, polítiques i econòmiques a través de qüestionaris a una població
aproximada actualment de 1500 persones de tota Catalunya i és la base dels nostres datasets"
    } })
  
  output$TextPartsCEO3 <- renderText({
    if (input$radio == "3") {
      "L'EvoluCEO és un subapartat dintre de la pàgina del CEO on es poden consultar gràficament
els diferents blocs del qüestionari de Baròmetre"
    }
  })
  
  #gràfic de quesito o bar o table
  output$grafics1 <- renderPlot({
    
    if (input$Grafic1 == "PChart1") {
      df <- as.data.frame(table(DataFinalFactor1$VALORACIÓ_SITUACIÓ_POLÍTICA))
      colnames(df) <- c("class", "freq")
      gg1 <- ggplot(df, aes(x = "", y = freq, fill = factor(class))) +
        geom_bar(width = 1, stat = "identity") +
        theme(axis.line = element_blank(),
              plot.title = element_text(hjust = 0.5)) +
        labs(fill = "class",
             x = NULL,
             y = NULL,
             title = "Pie Chart of VALORACIÓ_SITUACIÓ_POLÍTICA",
             caption = "Source: CEO")
      gg1 + coord_polar(theta = "y", start = 0)
    }
    #aviso, poso el 2 gràfic aqui
    else if (input$Grafic1 == "Barchart1"){
      gg1 <- ggplot(DataFinalFactor ,aes(x = VALORACIÓ_SITUACIÓ_ECONÒMICA)) + geom_bar(fill="darkgoldenrod2") + theme_bw()
      gg1 + labs(title = "Valoració Situació Econòmica", y = "NºEnquestats", x = "Categories de la Resposta", caption="Font: CEO")+
        theme(plot.title=element_text(size=30, face="bold"), 
              axis.text.x=element_text(size=15), 
              axis.text.y=element_text(size=15),
              axis.title.x=element_text(size=25),
              axis.title.y=element_text(size=25))+
        theme(axis.text.x = element_text(angle=65, vjust=0.6))
    }
    # else if(input$Grafic1 == "TauFreq1"){
    # 
    #     gg1 <- as.data.frame(table(DataFinalFactor$VALORACIÓ_NIVELL_AUTONOMIA))
    #     colnames(gg1) <- c("VALORACIÓ_NIVELL_AUTONOMIA","Frequencia")
    #     plot(gg1)
    #   } 
    })
    
    
  
 # output$grafics2 <- renderPlot({
    # if (input$Grafic1 == "Barchart1"){
    #   gg1 <- ggplot(DataFinalFactor ,aes(x = VALORACIÓ_SITUACIÓ_ECONÒMICA)) + geom_bar(fill="darkgoldenrod2") + theme_bw()
    #   gg1 + labs(title = "Valoració Situació Econòmica", y = "NºEnquestats", x = "Categories de la Resposta", caption="Font: CEO")+
    #     theme(plot.title=element_text(size=30, face="bold"), 
    #           axis.text.x=element_text(size=15), 
    #           axis.text.y=element_text(size=15),
    #           axis.title.x=element_text(size=25),
    #           axis.title.y=element_text(size=25))+
    #     theme(axis.text.x = element_text(angle=65, vjust=0.6))
    # }})
  output$grafics3 <- DT::renderDataTable({
  if(input$Grafic1 == "TauFreq1"){
    DT::datatable({
      gg1 <- as.data.frame(table(DataFinalFactor$VALORACIÓ_NIVELL_AUTONOMIA))
      colnames(gg1) <- c("VALORACIÓ_NIVELL_AUTONOMIA","Frequencia")
      gg1
    })}
  })
  
  #DT table amb les diferents bases de dades, les originals i les treballades:
  #Consider using DT::renderDataTable() and DT::dataTableOutput()
  output$RawData <- DT::renderDataTable(
    DT::datatable({
      if(input$BasesCEO == "mydata1") {
        data<-mydata1[,3:30]
      } 
      if(input$BasesCEO == "mydata2"){
        data <- mydata2[,1:30]
      }
      if(input$BasesCEO == "DataFinal"){
        data<-DataFinal
      }
      data
    },
    options = list(autoWidth = TRUE,lengthMenu = list(c(7,15,-1),c('5','12','All')),pageLength = 4,initComplete = JS(
      "function(settings, json) {",
      "$(this.api().table().header()).css({'background-color': '#14fff6', 'color': '#FF1493'});",
      "}")),
    filter = "top",
    selection = "multiple",
    style = "bootstrap"
    ))
  
  #color podria posar el 14fff6 enlloc del #00CED1, i el verd complementari 1eff14
  # caption = htmltools::tags$caption(
  #   style = 'caption-side: bottom; text-align: center;',
  #   'Table2: ', htmltools::em('This is a simple caption for the table.')
  # )
  
  ###############################################################################
  
  #Pag2
  
  output$distPlot1a <- renderPlot({
    if (input$pType == "ggplot"|| input$pType =="Tots dos"){  
    pie1 <- input$Pie1
    df <- as.data.frame(table(DataFinalFactor1[pie1]))
    colnames(df) <- c("class", "freq")
    #colnames(dataInput()) <- c("class", "freq")
    pie <- ggplot(df, aes(x = "", y=freq, fill = factor(class))) +
      geom_bar(width = 1, stat = "identity") +
      theme(axis.line = element_blank(),
            plot.title = element_text(hjust=0.5)) +
      labs(fill="class",
           x=NULL,
           y=NULL,
           title="Pie Chart of class",
           caption="Source: CEO")
    
    pie + coord_polar(theta = "y", start=0)
    }  
  })
  
  output$distPlot1b <- renderPlotly({
    if (input$pType == "ploty" || input$pType =="Tots dos"){
    pie1 <- input$Pie1
    df <- as.data.frame(table(DataFinalFactor1[pie1]))
    #df <- as.data.frame(table(DataFinalFactor1$GR_EDAT))
    p <- plot_ly(df, labels = ~Var1, values = ~Freq, type = 'pie') %>%
      layout(title = 'Gràfic Pie amb Ploty',
             xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
             yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),legend = list(orientation = 'h'))
    p
    }
  })
  
  # output$distPlot2b <- renderPlotly({
  #   
  # })
  
  #Pag 3
  output$distPlot2a <- renderPlot({
    #Bar chart ceo:
    #if(input$pType2 == "ggplot"){
      nombar1 <- input$Bar1
      freqtable <- table(DataFinalFactor1[nombar1])
      df <- as.data.frame.table(freqtable)
      head(df)
      library(ggplot2)
      theme_set(theme_classic())
      # Plot
      g <- ggplot(df, aes(Var1, Freq))
      g + geom_bar(stat="identity", width = 0.5, fill="tomato2") + 
        labs(title="Bar Chart", 
             subtitle="Variable seleccionada", 
             caption="Source: CEO dataset") +
        theme(axis.text.x = element_text(angle=65, vjust=0.6))
    #}
  })
  
 
  
  #Pag 4
  output$distPlot3a <- DT::renderDataTable(
    DT::datatable({
      freq1 <- input$Freq1
      df <- as.data.frame(table(DataFinalFactor1[freq1]))
      #freqtable <- table(DataFinalFactor1$VALORACIÓ_SITUACIÓ_ECONÒMICA)
      #freqtable <- table(DataFinalFactor1[nombar1])
      #df <- as.data.frame.table(freqtable)
      #nomFreq <- input$Freq1
      #DataFinalFactor1[nomFreq]
      #DataFinalFactor1$VALORACIÓ_SITUACIÓ_ECONÒMICA
    },
    options = list(autoWidth = TRUE,lengthMenu = list(c(7,15,-1),c('5','12','All')),pageLength = 5,
                   initComplete = JS(
                     "function(settings, json) {",
                     "$(this.api().table().header()).css({'background-color': '#00CED1', 'color': '#FF1493'});",
                     "}")),
    filter = "top",
    selection = "multiple",
    style = "bootstrap"
    
    ))
  
  #codigo table segons any:
  # output$distPlotPie2 <- renderTable ({
  # pie2 <- input$PieDos
  # pie3 <- input$PieTres
  # #plot(pie2)
  # t <-as.data.frame(DataFinalFactor1[pie3==DataFinalFactor1$ANY_ENQUESTA,])
  # table(t[pie2])
  
  #Pag 5
  output$distPlotPie2 <- renderPlot ({
    # #if (input$pType == "ggplot"){  
    pie2 <- input$PieDos
    pie3 <- input$PieTres
    #plot(pie2)
    t <- as.data.frame(DataFinalFactor1[pie3==DataFinalFactor1$ANY_ENQUESTA,])
    df<- as.data.frame(table(t[pie2]))
    # 
    # df <- as.data.frame(table(DataFinalFactor[pieDos],DataFinalFactor$ANY_ENQUESTA[pieTres]))
      colnames(df) <- c("class", "freq")
      pie <- ggplot(df, aes(x = "", y=freq, fill = factor(class))) +
      geom_bar(width = 1, stat = "identity") +
      theme(axis.line = element_blank(),
            plot.title = element_text(hjust=0.5)) +
      labs(fill="class",
           x=NULL,
           y=NULL,
           title="Pie Chart of class",
           caption="Source: CEO")

    pie + coord_polar(theta = "y", start=0)

    })
     
  #Pag 6
  
  #DataFinalFactor<-glimpse(DataFinal%>% mutate_if(is.labelled,to_factor) )
  output$plotMosaic <- renderPlot({
   
    
    
    
    
    
    
    #####################################################################
    mos1 <- input$mosaic1
    mos2 <- input$mosaic2
    #plot(DataFinalFactor[,input$mosaic1])
  #df<-as.data.frame(DataFinalFactor1[,c(mosaic1,mosaic2)])
  #plot(table(df))
    # df1<-as.data.frame(DataFinalFactor[,mosaic1])
    # df2<-as.data.frame(DataFinalFactor[,mosaic2])
    # df<-as.data.frame(cbind(df1,df2))
    #table(df)
    #names(df1)
    #x = product(subset(DataFinalFactor,select = mc1), subset(DataFinalFactor,select = mc2))
  ggplot(data = DataFinalFactor) +
  #geom_mosaic(aes_string(x = product(!!sym(input$mosaic1),!!sym(input$mosaic2)), fill=!!sym(input$mosaic2), na.rm=TRUE)) +
    geom_mosaic(aes(x = product(!!sym(input$mosaic1),!!sym(input$mosaic2)), fill=!!sym(input$mosaic2), na.rm=TRUE)) +
    
     labs(x = input$mosaic2,y = input$mosaic1, title=paste(input$mosaic1, input$mosaic2, sep = " vs "))+
    #gg <- ggplot(data = DataFinalFactor) +
    #gg <- ggplot() +
     #geom_mosaic(aes( x = product(DataFinalFactor[,input$mosaic1],DataFinalFactor[,input$mosaic1]),na.rm=T))+
  #   #geom_mosaic(aes(weight = 1,x = product(DataFinalFactor1[,mosaic1]),fill=DataFinalFactor1[,mosaic2]), na.rm=TRUE)) +
      #labs(x = "Variable 1 x Variable 2 ", title='a ver que tal') +
      theme(axis.text.x = element_text(angle=65, vjust=0.6))
    # gg
  #ggplotly(gg)
  })
  
  # output$RawData2 <- DT::renderDataTable(
  #   DT::datatable({
  #     provabind2
  #     #dades_finals_Factor
  #   },
  #   options = list(autoWidth = TRUE,lengthMenu = list(c(7,15,-1),c('5','12','All')),pageLength = 3,initComplete = JS(
  #     "function(settings, json) {",
  #     "$(this.api().table().header()).css({'background-color': '#00CED1', 'color': '#FF1493'});",
  #     "}")),
  #   filter = "top",
  #   selection = "multiple",
  #   style = "bootstrap"
  #   ))
  #   
  # output$VarTable <- renderTable({
  #   head(provabind2[,input$OneVar])
  # })
  # 
  # output$plot3 <- renderPlot({
  #   plot(provabind2[,input$OneVar])
  # })
  # 
  # output$grafico3 <- renderPlot({
  #   stockdata<- getSymbols(input$OneVar,src = "yahoo",
  #                          from= "2019-01-01",to= "2019-07-27",auto.assign = F )
  #   candleChart(stockdata,name = input$OneVar)
  # })
  # 
  
  
}








shinyApp(ui = ui, server = server)
#runApp(display.mode = "showcase")

#runApp("E_2_prova.R", display.mode = "showcase")
