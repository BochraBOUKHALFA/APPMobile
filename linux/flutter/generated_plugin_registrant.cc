//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <draw_on/draw_on_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) draw_on_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "DrawOnPlugin");
  draw_on_plugin_register_with_registrar(draw_on_registrar);
}
