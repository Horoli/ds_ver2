from graphviz import Digraph

# Create a directed graph

dot = Digraph(comment="Barrel Structure Diagram", graph_attr={"rankdir": "TB"})

# External Public Barrels

dot.node("public_auth", "features/auth/public.dart", shape="box", style="filled", fillcolor="#FFD966")
dot.node("public_dashboard", "features/dashboard/public.dart", shape="box", style="filled", fillcolor="#FFD966")

# Internal Private Barrels

dot.node("private_data", "features/auth/private_data.dart", shape="box", style="filled", fillcolor="#C6E0B4")
dot.node("private_domain", "features/auth/private_domain.dart", shape="box", style="filled", fillcolor="#C6E0B4")
dot.node("private_presentation", "features/auth/private_presentation.dart", shape="box", style="filled", fillcolor="#C6E0B4")

# Implementation Files

dot.node("impl_files", "Implementation Files\n(models, repositories, controllers, screens, etc.)", shape="box", style="filled", fillcolor="#D9D9D9")

# Common Barrels

dot.node("packages", "app/common/packages.dart\n(3rd-party imports only)", shape="box", style="filled", fillcolor="#F4CCCC")
dot.node("core", "core/core.dart", shape="box", style="filled", fillcolor="#F4CCCC")
dot.node("network", "core/network/network.dart", shape="box", style="filled", fillcolor="#F4CCCC")

# Relationships

# Public barrels export internal barrels

dot.edge("public_auth", "private_data", label="export")
dot.edge("public_auth", "private_domain", label="export")
dot.edge("public_auth", "private_presentation", label="export")

# Internal barrels export implementation files

dot.edge("private_data", "impl_files", label="export")
dot.edge("private_domain", "impl_files", label="export")
dot.edge("private_presentation", "impl_files", label="export")

# Implementation files import common barrels

dot.edge("impl_files", "packages", label="import")
dot.edge("impl_files", "core", label="import")
dot.edge("core", "network", label="export")

# Dashboard public to impl (simplified)

dot.edge("public_dashboard", "impl_files", style="dashed", label="export (own impl)")

# Render diagram to file

output_path = "/mnt/data/barrel_structure"
dot.format = "png"
dot.render(output_path, cleanup=False)

output_path + ".png"
