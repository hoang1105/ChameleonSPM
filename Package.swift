{\rtf1\ansi\ansicpg1252\cocoartf2862
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fmodern\fcharset0 Courier;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs26 \cf0 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 // swift-tools-version:5.3\
import PackageDescription\
\
let package = Package(\
    name: "Chameleon",\
    platforms: [\
        .iOS(.v9) // H\uc0\u7895  tr\u7907  t\u7915  iOS 9 tr\u7903  l\'ean\
    ],\
    products: [\
        .library(\
            name: "Chameleon",\
            targets: ["Chameleon"]),\
    ],\
    dependencies: [],\
    targets: [\
        .target(\
            name: "Chameleon",\
            dependencies: [],\
            path: "Sources/Chameleon",\
            exclude: ["include"], // Lo\uc0\u7841 i tr\u7915  th\u432  m\u7909 c include kh\u7887 i ngu\u7891 n bi\'ean d\u7883 ch\
            publicHeadersPath: "include" // Ch\uc0\u7881  \u273 \u7883 nh \u273 \u432 \u7901 ng d\u7851 n t\u7899 i public header\
        )\
    ]\
)}