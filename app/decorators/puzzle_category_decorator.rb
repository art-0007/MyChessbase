# frozen_string_literal: true

class PuzzleCategoryDecorator < ApplicationDecorator
    delegate_all
    decorates_association :puzzle
  end