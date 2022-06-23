##
## Supermodel
## A Sega Model 3 Arcade Emulator.
## Copyright 2011-2020 Bart Trzynadlowski, Nik Henson, Ian Curtis,
##                     Harry Tuttle, and Spindizzi
##
## This file is part of Supermodel.
##
## Supermodel is free software: you can redistribute it and/or modify it under
## the terms of the GNU General Public License as published by the Free
## Software Foundation, either version 3 of the License, or (at your option)
## any later version.
##
## Supermodel is distributed in the hope that it will be useful, but WITHOUT
## ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
## FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
## more details.
##
## You should have received a copy of the GNU General Public License along
## with Supermodel.  If not, see <http://www.gnu.org/licenses/>.
##

#
# Makefile.OSX
#
# Makefile for Mac OS X systems using clang.
#


###############################################################################
# Build Options
###############################################################################

DELETE = rm -d -r -f


###############################################################################
# Platform Configuration
#
# Edit library and include paths as needed.
###############################################################################

#
# Must be included first
#
include Makefiles/Options.inc

#
# Toolchain
#
CC = clang
CXX = clang
LD = clang

#
# SDL
#

SDL_CFLAGS = 
SDL_LIBS = -framework AGL -framework OpenGL -framework GLUT -framework Cocoa
#-framework SDL2 
ifeq ($(strip $(NET_BOARD)),1)
	SDL_LIBS += -framework SDL2_net
endif

#
#	OSX-specific
#

PLATFORM_CXXFLAGS = $(SDL_CFLAGS) -DSUPERMODEL_OSX -F/opt/homebrew/lib/ -O3 -F/Library/Frameworks/ -I/opt/homebrew/include -I/opt/homebrew/include/SDL2 -D_THREAD_SAFE
PLATFORM_LDFLAGS = $(SDL_LIBS) -lz -lm -lstdc++ -F/opt/homebrew/lib/ -F/Library/Frameworks/ -L/opt/homebrew/Cellar/sdl2/2.0.22/lib -L/opt/homebrew/lib -lSDL2

###############################################################################
# Core Makefile
###############################################################################

include Makefiles/Rules.inc

clean:
	$(SILENT)echo Cleaning up \"$(BIN_DIR)\" and \"$(OBJ_DIR)\"...
	$(SILENT)$(DELETE) $(BIN_DIR)
	$(SILENT)$(DELETE) $(OBJ_DIR)
