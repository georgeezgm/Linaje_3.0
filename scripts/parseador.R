.GlobalEnv 
is.environment(.GlobalEnv)
###########################################################################################################################
################################################# FUNCION DE DEDUPLICACION ################################################
###########################################################################################################################
f_separar_q<- function(datos_ent){
  # eliminamos comentarios /* */ depurar para quedarnos solo con una
  datos_ent<-gsub("/\\*.*?\\*/", "", datos_ent)
  datos_ent<-gsub("\\/\\*(.*?)\\*\\/",'',datos_ent)  
  # eliminamos los comentarios -- hasta salto de linea reporar para quedarnos solo con una
  datos_ent<- gsub("\\-\\-(.*?)\\r",'',datos_ent)
  datos_ent<-gsub("\\-\\-.*?\n", "", datos_ent)
  # cambiamos las cadenas entre comillas por el estanadas text
  datos_ent<- gsub("\\'.*?\\'\\s*",'text ',datos_ent)
  ####################### proceso de partido
  cadena_salida<- unlist(str_split(datos_ent[2],';'))
  pos_elim<- which(cadena_salida=='')
  if (length(pos_elim)){cadena_salida<- cadena_salida[-pos_elim]}
  return(as.vector(t(cbind(apply(cbind(datos_ent[1],1:length(cadena_salida)),1, function(x) paste(x, collapse = '')),cadena_salida))))}
###########################################################################################################################

###########################################################################################################################
########################################################## FUNCION A TOKEN ################################################
###########################################################################################################################
fun_token<- function (cadena){
  chain_split<- strsplit(as.character(cadena), "")[[1]]
  sc_first<- 1
  chain_words<- list()
  for (i in 2:length(chain_split)){
    sc_element<- chain_split[i]
    sc_element_ant<- chain_split[i-1] 
    if (sc_element=='(' | sc_element==')' | sc_element==',') { if (sc_element_ant!=' ' & sc_element_ant!='(' & sc_element_ant!=')') {chain_words<- append(chain_words,str_trim(paste0(chain_split[sc_first:(i-1)],collapse ='')))}
      chain_words<- append(chain_words,sc_element)
      sc_first<- i+1}
    if (sc_element==' ' & !(sc_element_ant=='(' | sc_element_ant==')' | sc_element_ant==',')){ chain_words<- append(chain_words,str_trim(paste0(chain_split[sc_first:(i-1)],collapse ='')))
    sc_first<- i+1}
    if ( (i==length(chain_split))) {chain_words<- append(chain_words,str_trim(paste0(chain_split[sc_first:i],collapse ='')))}
    }
  return(unlist(chain_words))
}
###########################################################################################################################

###########################################################################################################################
############################################## BUSCAMOS BLOQUES PAR?NTESIS ################################################
################################### trabaja con bloques interiores de dentro a fuera ######################################
###########################################################################################################################
fun_token_bra<- function (cadena_token){
  bra_open <- which(cadena_token=='(')
  bra_close<- which(cadena_token==')')
  # para poder trabajar con consultas incompletas a?adimos al final parentesis
  if (length(bra_open)!=length(bra_close)){cadena_token<-c(cadena_token,rep(')',length(bra_open)-length(bra_close)))
  bra_close<- which(cadena_token==')')}
  if (length(bra_open)>=1){
    bra_mat<- cbind(c(bra_open,bra_close),c(rep(1,length(bra_open)),rep(0,length(bra_close))))
    bra_mat_sort<- bra_mat[sort(bra_mat[,1],index.return=T)$ix,]
    posiciones<- which((bra_mat_sort[,2]/c(0,bra_mat_sort[1:(dim(bra_mat_sort)[1]-1),2]))==0)
    pos_parseo<- cbind(bra_mat_sort[posiciones-1,1],bra_mat_sort[posiciones,1])} else {pos_parseo<-matrix()}
  return(pos_parseo)
}
###########################################################################################################################

###########################################################################################################################
############################################ CONSOLIDACION DE PARENTESIS ##################################################
################################## Esta funcion elimina los parentesis duplicados##########################################
###########################################################################################################################
consolida_par<- function (cadena_token){
  cadena_token_bra<- fun_token_bra(cadena_token)
  if (is.na(cadena_token_bra[1,1])) {return(gsub('~C~',')',gsub('~A~','(',cadena_token)))}
  para<- 0
  quitar<- vector()
  for (i in 1:dim(cadena_token_bra)[1]) {
    if ((cadena_token_bra[i,1]!=1) & (cadena_token_bra[i,2]!=length(cadena_token))){
      if (paste0(cadena_token[c(cadena_token_bra[i,1]-1,cadena_token_bra[i,2]+1)],collapse = '')=='()'){
        quitar<- c(quitar,cadena_token_bra[i,])
        # si cumple else cambiamos parentesis de apertura y cierre por valor para que siga trabajan con par externos
      } else {cadena_token[cadena_token_bra[i,1]]<-'~A~';cadena_token[cadena_token_bra[i,2]]<-'~C~'}
    } else {cadena_token[cadena_token_bra[i,1]]<-'~A~';cadena_token[cadena_token_bra[i,2]]<-'~C~'}
  }
  if (length(quitar)>0) {cadena_token<- cadena_token[-quitar]}
  # hacemos la llamda recursiva
  cadena_token<- consolida_par(cadena_token)
}
###########################################################################################################################

###########################################################################################################################
###################################### FUNCION PARA BUSCAR DENTRO BLOQUES PARENTESIS ######################################
###########################################################################################################################
#library(stringr) # la usamos para buscar el patr?n
fun_token_bra_rec<- function(cadena_token){
  cadena_token_bra<- fun_token_bra(cadena_token)
  if (is.na(cadena_token_bra)[1,1]){if (!(is.na(str_match(paste(cadena_token,collapse = ' '), "sel")))) {return(list(cadena_token))} else {return()}}
  cadena_token_sal<- cadena_token
  list_sel<- list()
  for (i in 1:dim(cadena_token_bra)[1]){
    posic<- cadena_token_bra[i,]
    subcadena<- paste(cadena_token[(posic[1]):(posic[2])], collapse = ' ')
    # es provisional, hay que meter la gram?tica para hacerlo bien y poder sacar los campos
    if (is.na(str_match(subcadena, "(sel )|(select )")[1,1])) {  
      # en este caso lo que va delante del parentesis es funcion y la eliminamos
      if (!(cadena_token[(posic[1]-1)] %in% c(',','(',')','select','sel'))) {posic_ini<- posic[1]-1 } else {posic_ini<- posic[1]}
      # en este caso lo que va detras deber?a ser un pseudonimo y lo dejamos como salida
      if (!(cadena_token[(posic[2]+1)] %in% c(',',')','(','from','group'))) {
        if(cadena_token[(posic[2]+1)]!='as'){
          posic_fin<- posic[2]+1 
          token_sal<- cadena_token[posic_fin]} else {posic_fin<- posic[2]+2;token_sal<- cadena_token[posic_fin]}} else {posic_fin<- posic[2]
          token_sal<- '<name>'}
    } else {list_sel<- append(list_sel,list(cadena_token[(posic[1]+1):(posic[2]-1)])) # quitamos parentesis en extremos
    posic_ini<- posic[1]
    posic_fin<- posic[2]
    token_sal<- '<table>'}
    
    cadena_token_sal[posic_ini]<- token_sal
    cadena_token_sal[(posic_ini+1):posic_fin]<- ''
  }
  #print(cadena_token_sal)
  #cadena_token_sal<- c(cadena_token_sal,cadena_token[cadena_token_bra[i,2]+1])
  llamada_rec<- fun_token_bra_rec(cadena_token_sal)
  if (!is.null(llamada_rec)) {list_sel<-append(list_sel,llamada_rec)}
  return(lapply(list_sel,function (x) gsub('\\s+',' ',paste0(x,collapse = ' '))))
}
###########################################################################################################################


#####################################################################################################################
########################################## FUNCION LIMPIADO PREVIO CADENAS ##########################################
#####################################################################################################################

f_quitar_com<- function(cadena_text)
{ # eliminamos comentarios /* */ depurar para quedarnos solo con una
  #salida<-gsub("/\\*.*?\\*/", "", cadena_text)
  #salida<-gsub("\\/\\*(.*?)\\*\\/",'',salida)  
  # eliminamos los comentarios -- hasta salto de linea reporar para quedarnos solo con una
  #salida<- gsub("\\-\\-(.*?)\\r",'',salida)
  #salida<-gsub("\\-\\-.*?\n", "", salida)
  salida<-gsub("\n", " ", cadena_text)
  salida<-gsub('\\\"', "", salida)
  salida<-gsub("\t", " ", salida)
  salida<-gsub("\r", " ", salida)
  #salida<-gsub("[\x7C]", "", salida) 
  salida<-gsub('\\s+',' ',salida)
  salida<- str_trim(salida)
  salida<- tolower(salida)  
  #salida<-gsub("extract.*?\\)","",salida)
  #salida<-gsub("leading.*?\\)","",salida)
  # si encuentra punto y como borramos hasta el final
  salida<- gsub(';.*','',salida)
  #limpiamos la sentencia using cuando va con delete
  salida<- gsub('using.*delete','delete',salida)
  #salida<- gsub('using.*ins','ins',salida)
  salida<- gsub('using.*(\\s+ins\\s+|\\s+insert\\s+)','insert ',salida)
  salida<- gsub('using.*(\\s+update\\s+)','update ',salida)
  salida<- str_trim(gsub('lock.*access','',salida))
  salida<- str_trim(gsub('lock.*nowait','',salida))
  salida<- gsub("^ct\\s+",'create table ',salida)
  return(salida)
}
#####################################################################################################################

#####################################################################################################################
################################################ PARSEO CONSULTA MULTILOAD ##########################################
#####################################################################################################################

func_consulta_multiload<- function(cadena_text_subquery_i){
  #repasar expresion
  tabla_principal_ml<- str_trim(str_match(cadena_text_subquery_i, "mload(.*)with")[2])
  tabla_aux_ml<- strsplit(str_match(cadena_text_subquery_i, "with(.*)")[2],'\\s|\\,')
  tabla_aux_ml<- tabla_aux_ml[[1]][!(tabla_aux_ml[[1]]=='')]
  consulta_sal<- rbind(cbind(unique(tabla_principal_ml),'mload','table'),cbind(unique(tabla_aux_ml),'create','table'))
  if(!class(consulta_sal)=='matrix') {consulta_sal<- matrix(consulta_sal,ncol=3)}
  return(consulta_sal)}

#####################################################################################################################
################################################ PARSEO CONSULTA BLOAD ##############################################
#####################################################################################################################

func_consulta_bload<- function(cadena_text_subquery_i){
  tabla_principal_ml<- str_match(cadena_text_subquery_i, "begin\\s+loading\\s+(\\S+)\\s+errorfiles")[2]
  tabla_aux_bl<- str_match(cadena_text_subquery_i, "errorfiles\\s+(\\S+)\\s*\\,\\s*(\\S+)(\\s+with|\\s*$|\\s+checkpoint)")[2:3]
  consulta_sal<- rbind(cbind(unique(tabla_principal_ml),'bload','table'),cbind(unique(tabla_aux_bl),'create','table'))
  if(!class(consulta_sal)=='matrix') {consulta_sal<- matrix(consulta_sal,ncol=3)}
  return(consulta_sal)}

#####################################################################################################################
################################################ PARSEO CONSULTA SELECCION ##########################################
#####################################################################################################################

func_consulta_sel<- function(cadena_text_subquery_i){
  # bloque de proceamiento estandar  
  subcadena_from<- unique(str_match_all(cadena_text_subquery_i, "from\\s*(.*?)((group)|(where)|(order)|(\\)|($)|(\\;)))")[[1]][,2])
  #limpiamos resultados raros con parentesis delante
  if (!is.na(subcadena_from[1])==TRUE){
    #limpiamos los registros con FOR 
    subcadena_from<- subcadena_from[unlist(lapply(subcadena_from, function(x){if(regexpr("( for )|( index )|(\\(index )",x)>0){salida<-FALSE} else {salida<-TRUE}}))]
    tabla_usadas_1<- unlist(strsplit(subcadena_from, "((inner join.)|(left join.)|(rigth join.)|(outer join)|(cross join)|( join))"))
    if(length(tabla_usadas_1)==1){
      tablas_usadas<- unlist(lapply(strsplit(unlist(lapply(strsplit(tabla_usadas_1,','),str_trim)),' '), function (x) return(x[1])))
    } else {
      tablas_usadas_3<- as.list(unlist(lapply(tabla_usadas_1,str_trim)))
      tablas_usadas_5<- rapply(tablas_usadas_3, function(x) if (substr(head(x, 1),1,1)!='(') {list(0,strsplit(head(x, 1),' ')[[1]][1])}
                               else{list(1,str_trim(substr(x,2,nchar(x)-1)))})
      tablas_usadas_6<- matrix(tablas_usadas_5,ncol=2,byrow=T)
      tablas_usadas<- tablas_usadas_6
      
      if( class(tablas_usadas)=='matrix') {posiciones_recursion<- which(tablas_usadas[,1]=='1')} else {posiciones_recursion<- which(tablas_usadas[1]=='1')}
      
      if (length(posiciones_recursion)>0) {
        r<- 0
        for( j in posiciones_recursion){
          fila<- j-r
          if(class(tablas_usadas)=='matrix'){
            tablas_usadas_rec<- func_consulta_sel(tablas_usadas[fila,2])
            tablas_usadas<- tablas_usadas[-(fila),]} else {
              tablas_usadas_rec <- func_consulta_sel(tablas_usadas[2])
            }
          r<- r+1
          if(!is.null(tablas_usadas_rec)==T) {tablas_usadas<- rbind(c(0,tablas_usadas_rec),tablas_usadas)}
        }
      }
      if (class(tablas_usadas)=='matrix') {return(cbind(unique(tablas_usadas[,2]),'select',''))} else {return(cbind(tablas_usadas[2],'select',''))}
    }
    return(cbind(unique(tablas_usadas),'select',''))
  }
  
}
#####################################################################################################################

#####################################################################################################################
##################################### FUNCION PARA CONSOLIDAR CON Y SIN PARENTESIS ##################################
#####################################################################################################################

func_consulta_sel_macro<- function(cadena_text_subquery_i){
  # tienen un union 
  cadena_trabajo<- cadena_text_subquery_i
  if (!is.na(str_match(cadena_text_subquery_i, "(\\s+union\\s+)|(\\s+minus\\s+)")[1,1])){
    # cadena_trabajo<- paste0(c('select * from (',unlist(strsplit(cadena_text_subquery_i,'(union) | (union all)')),')'), collapse =' ')
    cadena_trabajo<- paste0('select * from (', paste0(unlist(strsplit(cadena_text_subquery_i,'(\\s+union\\s+)| (\\s+union all\\s+)|(\\s+minus\\s+)')), collapse =') , ('),')',collapse = ' ')
  }
  
  if (!is.na(str_match(cadena_trabajo, "\\(")[1,1])) { 
    exp_select_para_par<- unlist(fun_token_bra_rec(consolida_par(fun_token(cadena_trabajo))))
    # obtenemos las tablas y quitamos tablas repetidas
    log_sel<- tryCatch({
      salida_tab<- unique(matrix(unlist(lapply(exp_select_para_par,function (x) t(func_consulta_sel(x)))),ncol=3, byrow = T))
      log_sel<- 'ok'
    }, error= function(e) {log<- 'error'; print(paste('error en select',i))})
    
    if (!exists('salida_tab')) {return()}
    # quitamos tablas condesadas <table>
    salida_tab_pos<- which(salida_tab[,1]=="<table>")
    if (length(salida_tab_pos)==0){return(salida_tab)} else { return(salida_tab[-salida_tab_pos,])}
  } else {return(func_consulta_sel(cadena_trabajo))}
}
#####################################################################################################################

#####################################################################################################################
##################################################### DELETE ########################################################
#####################################################################################################################

func_consulta_del<- function(cadena_text_subquery_i){
  tabla_ins<- gsub('\\(','',str_match(cadena_text_subquery_i,"del\\S*\\s+(from\\s+)*(\\S+)")[3])
  select<- str_match(cadena_text_subquery_i, "(sel).*")[1]
  consulta<- c(tabla_ins,'delete','')
  if (is.na(select)==F) {
    tablas_sel<- func_consulta_sel_macro(select)
    consulta<- rbind(consulta,tablas_sel)
  }
  if(!class(consulta)=='matrix') {consulta<- matrix(consulta,ncol=3)}
  return(consulta)}
#####################################################################################################################

#####################################################################################################################
##################################################### CREATE ########################################################
#####################################################################################################################

func_consulta_create<- function(cadena_text_subquery_i,co_query_amp){
  consulta<- str_match(cadena_text_subquery_i, "((?<=table)|(?<=view))\\s+(\\S*)")
  consulta<- c(consulta[3],'create',ifelse(str_match(cadena_text_subquery_i,"\\s+(table)\\s+")[2] =='table','table','view'))
  tablas_sel<- vector()
  
  if (!is.na(str_match(cadena_text_subquery_i, "(\\s|\\()(select\\s|sel\\s)")[3])) {
    
    if (is.na(str_match(cadena_text_subquery_i,'as\\s*\\('))==FALSE) {
      if (max(!is.na(str_match(cadena_text_subquery_i,'(\\s*with)|(\\)with)')))==1){
        cadena_select<- str_match(cadena_text_subquery_i,'(?<=as\\s{0,100}\\().*(?=\\)\\s*with)')
      } else {cadena_select<- str_match(cadena_text_subquery_i,'(?<=as\\s{0,100}\\().*(?=\\)\\s*$)')}} else{
        if (max(!is.na(str_match(cadena_text_subquery_i,'(\\s*with)')))==1){
          cadena_select<- str_match(cadena_text_subquery_i,'(?<=as\\s{0,100}).*(?=\\s*with)')} else {
            cadena_select<- str_match(cadena_text_subquery_i,'(?<=as\\s{0,100}).*')}
      }
    
    log_create<- tryCatch({
      tablas_sel<- func_consulta_sel_macro(str_trim(cadena_select))
      log_create<- 'ok'}, error= function(e) {log_create<- 'error'; print(paste('L::','sel', 'er_cq:',co_query_amp))})
    
    
    if (log_create=='ok') {consulta<- rbind(consulta,tablas_sel)}
  }
  if(!class(consulta)=='matrix') {consulta<- matrix(consulta,ncol=3)} 
  return(consulta)}
#####################################################################################################################

#####################################################################################################################
################################################## INSERT INTO ######################################################
#####################################################################################################################

func_consulta_ins<- function(cadena_text_subquery_i){
  #repasar expresion
  #tabla_ins<-  str_match( cadena_text_subquery_i, "((ins(\\s+|ert)\\s*(into)?\\s*(.*)))")[6]
  #tabla_ins<- strsplit(tabla_ins,'\\s|\\(')[[1]][1] #hay que quitarlo y mejorar la expresion regular
  tabla_ins<- gsub('\\(','',str_match(cadena_text_subquery_i, "ins(\\s+|ert\\s+)(into\\s+)*(\\S+)")[4])
  consulta<- c(tabla_ins,'insert','')
  if (!is.na(str_match(cadena_text_subquery_i,'values')[1,1])) {select<- str_match(cadena_text_subquery_i,'values(.*)')[[2]]  }
  else{select<- str_match(cadena_text_subquery_i, "(sel).*")[1]
  if (is.na(select)==F) {
    tablas_sel<- func_consulta_sel_macro(select)
    consulta<- rbind(consulta,tablas_sel)
  }}
  if(!class(consulta)=='matrix') {consulta<- matrix(consulta,ncol=3)}
  return(consulta)}
#####################################################################################################################

#####################################################################################################################
##################################################### DROP ##########################################################
#####################################################################################################################

func_consulta_drop<- function(cadena_text_subquery_i){
  #repasar expresion
  tabla_ins<- str_match(cadena_text_subquery_i, "((drop)\\s((table)|(view))\\s*(.*?)((\\;)|$))")
  tabla_ins<- strsplit(tabla_ins[7],' ')[[1]][1] #hay que quitarlo y mejorar la expresion regular
  consulta_sal<- cbind(unique(tabla_ins),'drop','')
  if(!class(consulta_sal)=='matrix') {consulta_sal<- matrix(consulta_sal,ncol=3)}
  return(consulta_sal)}
#####################################################################################################################


#####################################################################################################################
################################################## RENAME ###########################################################
#####################################################################################################################

func_consulta_rename<- function(cadena_text_subquery_i){
  tabla_rename<- str_trim(str_match(cadena_text_subquery_i, 'rename\\s+(table|view)\\s+(.*?)\\s+(as|to)\\s+(.*?)(\\;|$)')[c(2,3,5)])
  consulta_sal<- cbind(unique(tabla_rename[2:3]),c('rename out','rename in'),tabla_rename[1])
  if(!class(consulta_sal)=='matrix') {consulta_sal<- matrix(consulta_sal,ncol=3)}
  return(consulta_sal)}

#####################################################################################################################

#####################################################################################################################
##################################################### UPDATE ########################################################
#####################################################################################################################

func_consulta_update<- function(cadena_text_subquery_i){
  tabla_ins<- str_match(cadena_text_subquery_i, "(update)\\s+(.*)")
  tabla_ins<- strsplit(tabla_ins[3],' ')[[1]] 
  #hay que quitarlo y mejorar la expresion regular
  # tenenmos en ceunta el caso especial de update campo from tabla...
  if (tabla_ins[2]=='from') { if (is.na(str_match(tabla_ins[3],'\\('))){ 
        # select<- paste0(c('select ',str_match(cadena_text_subquery[[2]], "(.*)\\s+(set)\\s*")[1]), collapse = ' ')
        select<- paste0(c('select ',str_match(cadena_text_subquery_i, "(.*)\\s+(set)\\s*")[1]), collapse = ' ')
    tabla_sal<- tabla_ins[3]} else {
    #select<- paste0(c('select ',str_match(cadena_text_subquery[[2]], "(.*)\\s+(set)\\s*")[1]), collapse = ' ')
    select<- paste0(c('select ',str_match(cadena_text_subquery_i, "(.*)\\s+(set)\\s*")[1]), collapse = ' ')
    tabla_sal<- tabla_ins[1]
  }
  } else {tabla_sal<- tabla_ins[1]
          #if (!is.na(unique(as.vector(str_match(cadena_text_subquery_i, "\\s+(sel\\s+|select\\s+)"))))) { select<- str_match(cadena_text_subquery_i, "(sel\\s+|select\\s+).*")[1]}
          select<- str_match(cadena_text_subquery_i, "(sel\\s+|select\\s+).*")[1]}
  consulta<- c(tabla_sal,'update','')
  #if (exists('select')) {if (is.na(select)==F) {
  if (is.na(select)==F){
    tablas_sel<- func_consulta_sel_macro(select)
    consulta<- rbind(consulta,tablas_sel)
  }
  if(!class(consulta)=='matrix') {consulta<- matrix(consulta,ncol=3)}
  return(consulta)}
#####################################################################################################################

#####################################################################################################################
############################################### FUNCION PARSEO ######################################################
#####################################################################################################################


parseador<- function(tabla_logs_ent){ 
  #install.packages("data.table")
  #install.packages("stringr")
  
  library(stringr) # la usamos para buscar el patr?n
  library(data.table)
  
  #tabla_logs<-as.data.frame(matrix(unlist(apply(tabla_logs_ent,1,f_separar_q)),ncol=2, byrow = T), stringsAsFactors = FALSE )
  tabla_logs<- matrix(unlist(apply(tabla_logs_ent,1,f_separar_q)),ncol=2, byrow = T)
  #cadena_text_subquery<- lapply(tabla_logs[,2],f_quitar_com)$DS_QUERY
  cadena_text_subquery<- lapply(tabla_logs[,2],f_quitar_com)
  for (i in 1:length(cadena_text_subquery)){
    tablas_usadas_sal<- vector()
    
    log<- tryCatch({
      cadena_text_subquery_i<- cadena_text_subquery[[i]]
      if        (!is.na(str_match(cadena_text_subquery_i, "^sel.*?(\\s+from\\s+)")[2])) {tipo_consulta<-'sel'; tablas_usadas_sal<- func_consulta_sel_macro(cadena_text_subquery_i)}
      else { if (!is.na(str_match(cadena_text_subquery_i, "^(ins\\s+|insert\\s+)")[2])) {tipo_consulta<-'ins'; tablas_usadas_sal<- func_consulta_ins(cadena_text_subquery_i)}
        else { if (!is.na(str_match(cadena_text_subquery_i, "^drop\\s+(table|view)")[2])) {tipo_consulta<-'dro'; tablas_usadas_sal<- func_consulta_drop(cadena_text_subquery_i)}
          else { if (!is.na(str_match(cadena_text_subquery_i, "^create(.*)(table|view)")[3])) {tipo_consulta<-'cre'; tablas_usadas_sal<- func_consulta_create(cadena_text_subquery_i,tabla_logs[i,1])}
            else { if (!is.na(str_match(cadena_text_subquery_i, "^del")) ) {tipo_consulta<-'del'; tablas_usadas_sal<-func_consulta_del(cadena_text_subquery_i)}
              else { if (!is.na(str_match(cadena_text_subquery_i, "^rename"))) {tipo_consulta<-'ren'; tablas_usadas_sal<- func_consulta_rename(cadena_text_subquery_i)}
                else { if (!is.na(str_match(cadena_text_subquery_i, "^update"))) {tipo_consulta<-'upd';  tablas_usadas_sal<- func_consulta_update(cadena_text_subquery_i)}
                  else { if (!is.na(str_match(cadena_text_subquery_i, "^mload"))) {tipo_consulta<-'mlo'; tablas_usadas_sal<- func_consulta_multiload(cadena_text_subquery_i)}
                    else { if (!is.na(str_match(cadena_text_subquery_i, "^begin\\s+loading"))) {tipo_consulta<-'blo'; tablas_usadas_sal<- func_consulta_bload(cadena_text_subquery_i)}}}}}}}}}
      # ñiapa revidar
      if (class(tablas_usadas_sal)=="character"){ tablas_usadas_sal<- t(as.matrix(tablas_usadas_sal))}
      # ponemos un autonumerico de ordencación
      if ((length(tablas_usadas_sal))>0) {tablas_usadas_sal<- cbind(tablas_usadas_sal,1:dim(tablas_usadas_sal)[1])
      if (!is.matrix(tablas_usadas_sal) & length(tablas_usadas_sal)>0) {tablas_usadas_sal<- matrix(tablas_usadas_sal,byrow = T,ncol=3)}}
      log<- 'ok'}, error= function(e) {log<- 'error'; print(paste('L::',tipo_consulta, 'er_cq:',tabla_logs[i,1]))})
    
    # bloque de insercion
    if(length(tablas_usadas_sal)>0 & log=='ok'){
      if (exists('salida')==T) {salida<- append(salida,list(as.data.frame(cbind(tabla_logs[i,1],tablas_usadas_sal))))} 
      else{salida<-list(as.data.frame(cbind(tabla_logs[i,1],tablas_usadas_sal)))}}
  }
  return(rbindlist(salida ,use.names = T,fill = T))
}
#####################################################################################################################
