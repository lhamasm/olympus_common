require 'logging'

logger = Logging.logger['teste']
logger.level = :warn

logger.warn "teste"