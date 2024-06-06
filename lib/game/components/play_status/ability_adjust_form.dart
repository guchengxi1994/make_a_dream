import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/components/play_status/mixed_button.dart';
import 'package:make_a_dream/isar/player_record.dart';
import 'package:make_a_dream/opening_page/notifiers/player_notifier.dart';

class AbilityAdjustForm extends ConsumerStatefulWidget {
  const AbilityAdjustForm({super.key, required this.record});
  final PlayerRecord record;

  @override
  ConsumerState<AbilityAdjustForm> createState() => _AbilityAdjustFormState();
}

class _AbilityAdjustFormState extends ConsumerState<AbilityAdjustForm> {
  static const style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  late PlayerRecord record = widget.record;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Ability Adjust",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            _wrapper("Remaining: ${record.attributes}", null),
            _wrapper(
              "Endurance: ${record.ability.endurance.toInt()}",
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: LinearProgressIndicator(
                          value: record.ability.endurance / 100,
                          backgroundColor: Colors.grey,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.blue))),
                  const SizedBox(
                    width: 10,
                  ),
                  MixedButton(
                      onLongPressed: () {
                        if (record.ability.endurance > 0) {
                          setState(() {
                            record.ability.endurance -= 1;
                            record.attributes += 1;
                          });
                        }
                      },
                      onTap: () {
                        if (record.ability.endurance > 0) {
                          setState(() {
                            record.ability.endurance -= 1;
                            record.attributes += 1;
                          });
                        }
                      },
                      child: const Icon(Icons.remove)),
                  const SizedBox(
                    width: 5,
                  ),
                  MixedButton(
                    onLongPressed: () {
                      if (record.ability.endurance <= 99 &&
                          record.attributes > 0) {
                        setState(() {
                          record.ability.endurance += 1;
                          record.attributes -= 1;
                        });
                      }
                    },
                    onTap: () {
                      if (record.ability.endurance <= 99 &&
                          record.attributes > 0) {
                        setState(() {
                          record.ability.endurance += 1;
                          record.attributes -= 1;
                        });
                      }
                    },
                    splashColor: Colors.amber.withOpacity(0.2),
                    hoverColor: Colors.amber.withOpacity(0.5),
                    child: const Icon(Icons.add),
                  )
                ],
              )),
            ),
            _wrapper(
                "Vitality: ${record.ability.vitality.toInt()}",
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                        child: LinearProgressIndicator(
                            value: record.ability.vitality / 100,
                            backgroundColor: Colors.grey,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.blue))),
                    const SizedBox(
                      width: 10,
                    ),
                    MixedButton(
                        onLongPressed: () {
                          if (record.ability.vitality > 0) {
                            setState(() {
                              record.ability.vitality -= 1;
                              record.attributes += 1;
                            });
                          }
                        },
                        onTap: () {
                          if (record.ability.vitality > 0) {
                            setState(() {
                              record.ability.vitality -= 1;
                              record.attributes += 1;
                            });
                          }
                        },
                        child: const Icon(Icons.remove)),
                    const SizedBox(
                      width: 5,
                    ),
                    MixedButton(
                      onLongPressed: () {
                        if (record.ability.vitality <= 99 &&
                            record.attributes > 0) {
                          setState(() {
                            record.ability.vitality += 1;
                            record.attributes -= 1;
                          });
                        }
                      },
                      onTap: () {
                        if (record.ability.vitality <= 99 &&
                            record.attributes > 0) {
                          setState(() {
                            record.ability.vitality += 1;
                            record.attributes -= 1;
                          });
                        }
                      },
                      splashColor: Colors.amber.withOpacity(0.2),
                      hoverColor: Colors.amber.withOpacity(0.5),
                      child: const Icon(Icons.add),
                    )
                  ],
                ))),
            _wrapper(
                "Attunement: ${record.ability.attunement.toInt()}",
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                        child: LinearProgressIndicator(
                            value: record.ability.attunement / 100,
                            backgroundColor: Colors.grey,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.blue))),
                    const SizedBox(
                      width: 10,
                    ),
                    MixedButton(
                        onLongPressed: () {
                          if (record.ability.attunement > 0) {
                            setState(() {
                              record.ability.attunement -= 1;
                              record.attributes += 1;
                            });
                          }
                        },
                        onTap: () {
                          if (record.ability.attunement > 0) {
                            setState(() {
                              record.ability.attunement -= 1;
                              record.attributes += 1;
                            });
                          }
                        },
                        child: const Icon(Icons.remove)),
                    const SizedBox(
                      width: 5,
                    ),
                    MixedButton(
                      onLongPressed: () {
                        if (record.ability.attunement <= 99 &&
                            record.attributes > 0) {
                          setState(() {
                            record.ability.attunement += 1;
                            record.attributes -= 1;
                          });
                        }
                      },
                      onTap: () {
                        if (record.ability.attunement <= 99 &&
                            record.attributes > 0) {
                          setState(() {
                            record.ability.attunement += 1;
                            record.attributes -= 1;
                          });
                        }
                      },
                      splashColor: Colors.amber.withOpacity(0.2),
                      hoverColor: Colors.amber.withOpacity(0.5),
                      child: const Icon(Icons.add),
                    )
                  ],
                ))),
            _wrapper(
                "Strength: ${record.ability.strength.toInt()}",
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                        child: LinearProgressIndicator(
                            value: record.ability.strength / 100,
                            backgroundColor: Colors.grey,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.blue))),
                    const SizedBox(
                      width: 10,
                    ),
                    MixedButton(
                        onLongPressed: () {
                          if (record.ability.strength > 0) {
                            setState(() {
                              record.ability.strength -= 1;
                              record.attributes += 1;
                            });
                          }
                        },
                        onTap: () {
                          if (record.ability.strength > 0) {
                            setState(() {
                              record.ability.strength -= 1;
                              record.attributes += 1;
                            });
                          }
                        },
                        child: const Icon(Icons.remove)),
                    const SizedBox(
                      width: 5,
                    ),
                    MixedButton(
                      onLongPressed: () {
                        if (record.ability.strength <= 99 &&
                            record.attributes > 0) {
                          setState(() {
                            record.ability.strength += 1;
                            record.attributes -= 1;
                          });
                        }
                      },
                      onTap: () {
                        if (record.ability.strength <= 99 &&
                            record.attributes > 0) {
                          setState(() {
                            record.ability.strength += 1;
                            record.attributes -= 1;
                          });
                        }
                      },
                      splashColor: Colors.amber.withOpacity(0.2),
                      hoverColor: Colors.amber.withOpacity(0.5),
                      child: const Icon(Icons.add),
                    ),
                  ],
                ))),
            _wrapper(
                "Dexterity: ${record.ability.dexterity.toInt()}",
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                        child: LinearProgressIndicator(
                            value: record.ability.dexterity / 100,
                            backgroundColor: Colors.grey,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.blue))),
                    const SizedBox(
                      width: 10,
                    ),
                    MixedButton(
                        onLongPressed: () {
                          if (record.ability.dexterity > 0) {
                            setState(() {
                              record.ability.dexterity -= 1;
                              record.attributes += 1;
                            });
                          }
                        },
                        onTap: () {
                          if (record.ability.dexterity > 0) {
                            setState(() {
                              record.ability.dexterity -= 1;
                              record.attributes += 1;
                            });
                          }
                        },
                        child: const Icon(Icons.remove)),
                    const SizedBox(
                      width: 5,
                    ),
                    MixedButton(
                      onLongPressed: () {
                        if (record.ability.dexterity <= 99 &&
                            record.attributes > 0) {
                          setState(() {
                            record.ability.dexterity += 1;
                            record.attributes -= 1;
                          });
                        }
                      },
                      onTap: () {
                        if (record.ability.dexterity <= 99 &&
                            record.attributes > 0) {
                          setState(() {
                            record.ability.dexterity += 1;
                            record.attributes -= 1;
                          });
                        }
                      },
                      splashColor: Colors.amber.withOpacity(0.2),
                      hoverColor: Colors.amber.withOpacity(0.5),
                      child: const Icon(Icons.add),
                    )
                  ],
                ))),
            _wrapper(
                "Intelligence: ${record.ability.intelligence.toInt()}",
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                        child: LinearProgressIndicator(
                            value: record.ability.intelligence / 100,
                            backgroundColor: Colors.grey,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.blue))),
                    const SizedBox(
                      width: 10,
                    ),
                    MixedButton(
                        onLongPressed: () {
                          if (record.ability.intelligence > 0) {
                            setState(() {
                              record.ability.intelligence -= 1;
                              record.attributes += 1;
                            });
                          }
                        },
                        onTap: () {
                          if (record.ability.intelligence > 0) {
                            setState(() {
                              record.ability.intelligence -= 1;
                              record.attributes += 1;
                            });
                          }
                        },
                        child: const Icon(Icons.remove)),
                    const SizedBox(
                      width: 5,
                    ),
                    MixedButton(
                      onLongPressed: () {
                        if (record.ability.intelligence <= 99 &&
                            record.attributes > 0) {
                          setState(() {
                            record.ability.intelligence += 1;
                            record.attributes -= 1;
                          });
                        }
                      },
                      onTap: () {
                        if (record.ability.intelligence <= 99 &&
                            record.attributes > 0) {
                          setState(() {
                            record.ability.intelligence += 1;
                            record.attributes -= 1;
                          });
                        }
                      },
                      splashColor: Colors.amber.withOpacity(0.2),
                      hoverColor: Colors.amber.withOpacity(0.5),
                      child: const Icon(Icons.add),
                    )
                  ],
                ))),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Expanded(child: SizedBox()),
                ElevatedButton(
                    onPressed: () {
                      ref.read(playerProvider.notifier).changeAndUpdate(record);
                    },
                    child: const Text("Submit"))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _wrapper(String text, Widget? progress) {
    return Row(
      children: [
        Tooltip(
          message: progress == null ? "" : "某种特殊的能力，可能和解锁某些内容有关",
          child: SizedBox(
            width: 200,
            child: Text(
              text,
              style: style,
            ),
          ),
        ),
        progress ?? const SizedBox()
      ],
    );
  }
}
