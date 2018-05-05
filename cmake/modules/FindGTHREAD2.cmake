# - Try to find GThread2 
#
# $Id: FindGTHREAD2.cmake 37103 2011-05-12 21:13:00Z jmayer $
#
# Find GThread headers, libraries and the answer to all questions.
#
#  GTHREAD2_FOUND               True if GTHREAD2 got found
#  GTHREAD2_INCLUDE_DIRS        Location of GTHREAD2 headers 
#  GTHREAD2_LIBRARIES           List of libraries to use GTHREAD2 
#
#  Copyright (c) 2008 Bjoern Ricks <bjoern.ricks@googlemail.com>
#
#  Redistribution and use is allowed according to the terms of the New
#  BSD license.
#  For details see the accompanying COPYING-CMAKE-SCRIPTS file.
#

INCLUDE( FindPkgConfig )

IF ( GTHREAD2_FIND_REQUIRED )
	SET( _pkgconfig_REQUIRED "REQUIRED" )
ELSE( GTHREAD2_FIND_REQUIRED )
	SET( _pkgconfig_REQUIRED "" )	
ENDIF ( GTHREAD2_FIND_REQUIRED )

IF ( GTHREAD2_MIN_VERSION )
	PKG_SEARCH_MODULE( GTHREAD2 ${_pkgconfig_REQUIRED} gthread-2.0>=${GTHREAD2_MIN_VERSION} )
ELSE ( GTHREAD2_MIN_VERSION )
	PKG_SEARCH_MODULE( GTHREAD2 ${_pkgconfig_REQUIRED} gthread-2.0 )
ENDIF ( GTHREAD2_MIN_VERSION )


IF( NOT GTHREAD2_FOUND AND NOT PKG_CONFIG_FOUND )
	FIND_PATH( GTHREAD2_INCLUDE_DIRS gthread.h PATH_SUFFIXES glib-2.0 glib GLib.framework/Headers/glib )
	IF ( APPLE ) 
		FIND_LIBRARY( GTHREAD2_LIBRARIES glib )
	ELSE ( APPLE )
		FIND_LIBRARY( GTHREAD2_LIBRARIES gthread-2.0 )
	ENDIF ( APPLE )
	
	#MESSAGE( STATUS "Gthread headers: ${GTHREAD2_INCLUDE_DIRS}" )
	#MESSAGE( STATUS "Gthread libs: ${GTHREAD2_LIBRARIES}" )
	
	# Report results
	IF ( GTHREAD2_LIBRARIES AND GTHREAD2_INCLUDE_DIRS )	
		SET( GTHREAD2_FOUND 1 )
		IF ( NOT GTHREAD2_FIND_QUIETLY )
			MESSAGE( STATUS "Found GTHREAD2: ${GTHREAD2_LIBRARIES} ${GTHREAD2_INCLUDE_DIRS}" )
		ENDIF ( NOT GTHREAD2_FIND_QUIETLY )
	ELSE ( GTHREAD2_LIBRARIES AND GTHREAD2_INCLUDE_DIRS )	
		IF ( GTHREAD2_FIND_REQUIRED )
			MESSAGE( SEND_ERROR "Could NOT find GTHREAD2" )
		ELSE ( GTHREAD2_FIND_REQUIRED )
			IF ( NOT GTHREAD2_FIND_QUIETLY )
				MESSAGE( STATUS "Could NOT find GTHREAD2" )	
			ENDIF ( NOT GTHREAD2_FIND_QUIETLY )
		ENDIF ( GTHREAD2_FIND_REQUIRED )
	ENDIF ( GTHREAD2_LIBRARIES AND GTHREAD2_INCLUDE_DIRS )
ENDIF( NOT GTHREAD2_FOUND AND NOT PKG_CONFIG_FOUND )

MARK_AS_ADVANCED( GTHREAD2_LIBRARIES GTHREAD2_INCLUDE_DIRS )