
logger <- create.logger()
logfile(logger) <- 'conectarTeradata.log'
level(logger) <- 'DEBUG'
#levellog(logger, level, message)
debug(logger, 'A Debugging Message')
info(logger, 'An Info Message')
warn(logger, 'A Warning Message')
error(logger, 'An Error Message')
fatal(logger, 'A Fatal Error Message')