import sys
import nose

config = nose.config.Config()
config.addPaths = False

nose.main(config=config)
