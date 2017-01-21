require 'test_helper'

class KalahTest < Minitest::Test
 include Kalah
  def setup
  end

  def test_that_it_has_a_version_number
    refute_nil ::Kalah::VERSION
  end

  def test_new_game_with_default_seeds
    game = Kalah.new(6)
    assert_equal(:P1, game.current_player)
    game.current_players_houses.each do |house|
      seeds = game.stores[house]
      assert_equal(6,seeds)
    end
    seeds = game.stores[game.current_players_store]
    assert_equal(0,seeds)
  end

  def test_new_game_with_number_of_seeds
    game = Kalah.new(1)
    assert_equal(:P1, game.current_player)
    game.current_players_houses.each do |house|
      seeds = game.stores[house]
      assert_equal(1,seeds)
    end
    seeds = game.stores[game.current_players_store]
    assert_equal(0,seeds)
  end

  def test_if_last_seeds_ends_in_store_current_player_remains_the_same
    game = Kalah.new(1)
    game.play(6)
    assert_equal(:P1, game.current_player)
    assert_equal(0, game.stores[5])
    seeds = game.stores[game.current_players_store]
    assert_equal(1,seeds)
  end

  def test_passing_own_store_wins_a_seed
    game = Kalah.new(1)
    game.play(6)
    seeds = game.stores[game.current_players_store]
    assert_equal(1, seeds)
  end

  def test_if_last_seeds_ends_in_store_current_remains_turn
    game = Kalah.new(1)
    game.play(6)
    assert_equal(:P1, game.current_player)
  end

  def test_last_seed_in_empty_house_current_player_changes
    game = Kalah.new(1)
    game.play(6)
    game.play(5)
    assert_equal(:P2, game.current_player)
  end

  def test_winning_opposite_seeds_if_seeds_ends_own_house
    game = Kalah.new(1)
    game.play(6)
    assert_equal(:P1, game.current_player)
    seeds = game.stores[game.current_players_store]
    assert_equal(1,seeds)
    game.play(5)
    assert_equal(:P2, game.current_player)
    assert_equal(1, game.stores[5])
    assert_equal(0, game.stores[4])
  end
end
