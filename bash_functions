#!/bin/bash

function scd () {
  cd ${PWD/$1/$2}
}
