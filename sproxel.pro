
QT += core gui opengl widgets svg

TARGET = sproxel
TEMPLATE = app
CONFIG += c+11

INCLUDEPATH += Imath

macx: {
	LIBS += -L/usr/lib -lpython2.7 -I/usr/include/python2.7 -lobjc -framework Foundation
	DEFINES += SPROXEL_USE_PYTHON
}

unix:!macx {
  CONFIG += link_pkgconfig
  PKGCONFIG += python2
  QMAKE_CXXFLAGS += -std=c++0x
  DEFINES += SPROXEL_USE_PYTHON
}

win32 {
  INCLUDEPATH += Imath
  DEFINES += NOMINMAX
  QMAKE_CXXFLAGS += -wd4996
  RC_FILE = sproxel.rc
}

SOURCES += \
    GLCamera.cpp \
    GLModelWidget.cpp \
    MainWindow.cpp \
    main.cpp \
    NewGridDialog.cpp \
    PreferencesDialog.cpp \
    PaletteWidget.cpp \
    LayersWidget.cpp \
    ProjectWidget.cpp \
    Tools.cpp \
    UndoManager.cpp \
    ImportExport.cpp \
    SproxelProject.cpp \
    GenLand.cpp \
    script.cpp \
    pyConsole.cpp \
    pyBindings.cpp \
    pyImportExport.cpp \
    util/macsupport.mm \
    Imath/ImathVec.cpp \
    Imath/ImathShear.cpp \
    Imath/ImathRandom.cpp \
    Imath/ImathMatrixAlgo.cpp \
    Imath/ImathFun.cpp \
    Imath/ImathColorAlgo.cpp \
    Imath/ImathBox.cpp \
    Imath/IexBaseExc.cpp


HEADERS  += \
    Foundation.h \
    GLCamera.h \
    GLModelWidget.h \
    GameVoxelGrid.h \
    VoxelGridGroup.h \
    SproxelProject.h \
    MainWindow.h \
    NewGridDialog.h \
    PreferencesDialog.h \
    PaletteWidget.h \
    LayersWidget.h \
    ProjectWidget.h \
    Tools.h \
    UndoManager.h \
    ImportExport.h \
    script.h \
    pyConsole.h \
    pyBindings.h \
    ConsoleWidget.h \
    glue/classGlue.h \
    util/macsupport.h \
    Imath/ImathVecAlgo.h \
    Imath/ImathVec.h \
    Imath/ImathSphere.h \
    Imath/ImathShear.h \
    Imath/ImathRoots.h \
    Imath/ImathRandom.h \
    Imath/ImathQuat.h \
    Imath/ImathPlatform.h \
    Imath/ImathPlane.h \
    Imath/ImathMatrixAlgo.h \
    Imath/ImathMatrix.h \
    Imath/ImathMath.h \
    Imath/ImathLineAlgo.h \
    Imath/ImathLine.h \
    Imath/ImathLimits.h \
    Imath/ImathInterval.h \
    Imath/ImathInt64.h \
    Imath/ImathHalfLimits.h \
    Imath/ImathGLU.h \
    Imath/ImathGL.h \
    Imath/ImathFun.h \
    Imath/ImathFrustum.h \
    Imath/ImathFrame.h \
    Imath/ImathExc.h \
    Imath/ImathEuler.h \
    Imath/ImathColorAlgo.h \
    Imath/ImathColor.h \
    Imath/ImathBoxAlgo.h \
    Imath/ImathBox.h \
    Imath/IexBaseExc.h \
    Imath/half.h

FORMS += \
    NewGridDialog.ui

RESOURCES += \
    sproxel.qrc

ICON = icons/sproxel.icns

CONFIG(c++11): C11 = -c11
CONFIG(debug, debug|release): DBG = dbg
else: DBG = rel

DESTDIR = $$PWD/build-$$[QMAKE_SPEC]$$C11
SUBDIR = $${TEMPLATE}$${TARGET}.$${DBG}
OBJECTS_DIR = $$DESTDIR/$$SUBDIR/obj
MOC_DIR = $$DESTDIR/$$SUBDIR/ui
UI_DIR = $$DESTDIR/$$SUBDIR/ui
RCC_DIR = $$DESTDIR/$$SUBDIR/ui


# deployment options:

COMMON_CFG.files = distro/common
COMMON_CFG.path = Frameworks
QMAKE_BUNDLE_DATA += COMMON_CFG

target.path += bin
INSTALLS += target
