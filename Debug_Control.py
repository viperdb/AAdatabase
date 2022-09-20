import logging
DEBUG_ENABLED = True
INFO_ENABLED = True
ERROR_ENABLED = True
LOG_NAME = "debug.log"
BASE_PATH = "./"

Output = ["LogFile"]

#logging.basicConfig(filename=f"{BASE_PATH}/{LOG_NAME}",  level=logging.DEBUG,
#                    format='%(asctime)s %(levelname)-8s %(message)s',
#                    datefmt='%Y-%m-%d %H:%M:%S')


def change_config():
    logging.basicConfig(filename=f"{BASE_PATH}/{LOG_NAME}", level=logging.DEBUG,
                        format='%(asctime)s %(levelname)-8s %(message)s',
                        datefmt='%Y-%m-%d %H:%M:%S')


def print_message(message):
    if DEBUG_ENABLED:
        if "Console" in Output:
            print(message)
        if "LogFile" in Output:
            logging.debug(message)


def print_info(message):
    if INFO_ENABLED:
        if "Console" in Output:
            print(message)
        if "LogFile" in Output:
            logging.info(message)


def print_error(message, error=None):
    if ERROR_ENABLED:
        if "Console" in Output:
            print(message)
        if "LogFile" in Output:

            if error is not None:
                # logging.error(error)
                logging.error(message, exc_info=error)
            else:
                logging.error(message)