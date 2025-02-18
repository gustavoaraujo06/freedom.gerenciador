"use client";
import { CSmartTable } from "@coreui/react-pro";

export default function NotasTable() {
  const columns = [
    {
      key: "numeroNF",
      label: "Numero NF",
    },
  ];
  const items = [
    {
      numeroNF: "35250100222023000140550010000008621200755371",
    },
  ];
  return <CSmartTable columns={columns} items={items} />;
}
