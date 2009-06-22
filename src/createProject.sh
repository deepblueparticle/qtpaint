
if test -z "${QMAKE}" ; then
    QMAKE=qmake
fi

## REMEMBER: any changes below should also be applied to
## qtpaint.pro.win

echo "

## NOTE: autogenerated by createProject.sh -- do not modify!!

TEMPLATE = lib

##QT += svg
QT += opengl

# Input
HEADERS += Painter.hpp QtPainter.hpp OpenGLPainter.hpp PaintUtils.hpp
HEADERS += ScenePainter.hpp QtBasePainter.hpp TestWidget.hpp
HEADERS += Layer.hpp PlotView.hpp RLayer.hpp conversion.h

SOURCES += init.cpp
SOURCES += ViewWrappers.cpp
SOURCES += QtPainter.cpp OpenGLPainter.cpp ScenePainter.cpp QtBasePainter.cpp
SOURCES += Layer.cpp RLayer.cpp PlotView.cpp PaintUtils.cpp 
SOURCES += PainterWrappers.cpp conversion.cpp
SOURCES += TestWidget.cpp
SOURCES += imports.cpp

INCLUDEPATH += ${R_INCLUDE_DIR}
INCLUDEPATH += ${CLINK_CPPFLAGS/-I/}
CFLAGS += -g
## LIBS += -L${R_HOME/lib}


macx{
LIBS += -framework R
}
unix{
LIBS += -L${R_HOME}/lib -lR
}
win32{
LIBS += -L${R_HOME}/bin -lR
}


" > qtpaint.pro

if test `uname` == "Darwin" ; then
    ${QMAKE} -spec macx-g++ -o Makefile.qtpaint
else 
    ${QMAKE} -o Makefile.qtpaint    
fi

## if macx; do 
##     ${QMAKE} -spec macx-g++ -o Makefile.qtpaint
## else

