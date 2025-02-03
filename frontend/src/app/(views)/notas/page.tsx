"use client";

import { cilSpreadsheet } from "@coreui/icons";
import CIcon from "@coreui/icons-react";
import { CBadge, CCol, CFormInput, CInputGroup, CInputGroupText, CSmartTable } from "@coreui/react-pro";
import type { Item } from "@coreui/react-pro/src/components/smart-table/types";

export default function Notas(){
    const columns = [
        { key : 'emitente', },
        { key : 'data', },
        { key : 'valor', },
        { key : 'status', },
    ];
    const items = [
        { emitente : 'Surugotannngo', data : '01/01/2025', valor : 1000, status : 'Pago' },
        { emitente : 'Empresa B', data : '06/12/2024', valor : 2000, status : 'Pendente' },
        { emitente : 'Empresa C', data : '05/12/2024', valor : 3000, status : 'Pago' },
        { emitente : 'Empresa A', data : '03/11/2024', valor : 4000, status : 'Pendente' },
        { emitente : 'Empresa B', data : '01/11/2024', valor : 5000, status : 'Pago' },
        { emitente : 'Surugotannngo', data : '01/01/2025', valor : 1000, status : 'Pago' },
        { emitente : 'Empresa B', data : '06/12/2024', valor : 2000, status : 'Pendente' },
        { emitente : 'Empresa C', data : '05/12/2024', valor : 3000, status : 'Pago' },
        { emitente : 'Empresa A', data : '03/11/2024', valor : 4000, status : 'Pendente' },
        { emitente : 'Empresa B', data : '01/11/2024', valor : 5000, status : 'Pago' },
        { emitente : 'Surugotannngo', data : '01/01/2025', valor : 1000, status : 'Pago' },
        { emitente : 'Empresa B', data : '06/12/2024', valor : 2000, status : 'Pendente' },
        { emitente : 'Empresa C', data : '05/12/2024', valor : 3000, status : 'Pago' },
        { emitente : 'Empresa A', data : '03/11/2024', valor : 4000, status : 'Pendente' },
        { emitente : 'Empresa B', data : '01/11/2024', valor : 5000, status : 'Pago' },
        { emitente : 'Surugotannngo', data : '01/01/2025', valor : 1000, status : 'Pago' },
        { emitente : 'Empresa B', data : '06/12/2024', valor : 2000, status : 'Pendente' },
        { emitente : 'Empresa C', data : '05/12/2024', valor : 3000, status : 'Pago' },
        { emitente : 'Empresa A', data : '03/11/2024', valor : 4000, status : 'Pendente' },
        { emitente : 'Empresa B', data : '01/11/2024', valor : 5000, status : 'Pago' },
    ]
    return (
        <CCol>
            <h2>
                Adicionar Nota
            </h2>
            <CInputGroup className="mb-3">
                <CInputGroupText id="numero-nota-fiscal">
                    <CIcon icon={cilSpreadsheet} />
                </CInputGroupText>
                <CFormInput placeholder="N° Nota Fiscal" aria-label="numero nota fiscal" aria-describedby="numero-nota-fiscal" />
            </CInputGroup>
            <CSmartTable
                items={items}
                columns={columns}
                scopedColumns={{
                    valor : (item : Item) => {
                        return (
                            <td>
                                {new Intl.NumberFormat('pt-BR', { style : 'currency', currency : 'BRL' }).format(item.valor)}
                            </td>
                        )
                    },
                    status: (item : Item) => {
                        return (
                            <td>
                                <CBadge color={item.status === 'Pago' ? 'success' : 'danger'}>
                                    {item.status}
                                </CBadge>
                            </td>
                        )
                    },
                    data: (item : Item) => {
                        const options: Intl.DateTimeFormatOptions = {
                            year: 'numeric',
                            month: 'long',
                            day: 'numeric',
                          }
                        return (
                            <td>
                                {new Date(item.data).toLocaleDateString('pt-BR', options)}
                            </td>
                        )
                    }
                }}
                >

            </CSmartTable>
        </CCol>
    )
}