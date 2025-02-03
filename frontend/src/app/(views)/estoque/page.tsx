'use client'
import { useState } from 'react'
import {
  CButton,
  CCol,
  CSmartTable,
  CModal,
  CModalHeader,
  CModalBody,
  CModalFooter,
  CForm,
  CInputGroup,
  CFormLabel,
  CFormInput,
} from '@coreui/react-pro'
import { CChartLine } from '@coreui/react-chartjs'
import { Item } from '@coreui/react-pro/src/components/smart-table/types'

export default function Estoque() {
  const [activeItem, setActiveItem] = useState<Item | null>(null)
  const [showAddModal, setShowAddModal] = useState(false)
  const [newItem, setNewItem] = useState<Item>({
    product: '',
    inventory: 0,
    orders: 0,
    value: 0.0,
    stockValue: 0.0,
    salesHistory: [],
  })

  const columns = [
    { key: 'product', label: 'Produto' },
    { key: 'inventory', label: 'Em Estoque' },
    { key: 'orders', label: 'Pedidos' },
    { key: 'value', label: 'Valor Unitário' },
    { key: 'stockValue', label: 'Valor em Estoque' },
    { key: 'actions', label: '' },
  ]
  const [items, setItems] = useState<Item[]>([
    {
      product: 'Produto A',
      inventory: 100,
      orders: 50,
      value: 10.0,
      stockValue: 1000.0,
      salesHistory: [10, 20, 30, 40, 50, 60, 70],
    },
    {
      product: 'Produto B',
      inventory: 200,
      orders: 80,
      value: 20.0,
      stockValue: 4000.0,
      salesHistory: [20, 30, 40, 50, 60, 70, 80],
    },
  ])
  const handleAddItem = () => {
    const itemToAdd = { ...newItem, stockValue: newItem.inventory * newItem.value }
    setItems((prev) => [...prev, itemToAdd])
    setShowAddModal(false)
    setNewItem({
      product: '',
      inventory: 0,
      orders: 0,
      value: 0.0,
      stockValue: 0.0,
      salesHistory: [],
    })
  }

  return (
    <CCol>
      <CButton className="mb-3" color="success" onClick={() => setShowAddModal(true)}>
        Adicionar Item
      </CButton>
      <CSmartTable
        columns={columns}
        items={items}
        columnSorter
        scopedColumns={{
          value: (item: Item) => (
            <td>
              {new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(
                item.value,
              )}
            </td>
          ),
          stockValue: (item: Item) => (
            <td>
              {new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(
                item.value * item.inventory,
              )}
            </td>
          ),
          actions: (item: Item) => (
            <td>
              <CButton color="primary" onClick={() => setActiveItem(item)}>
                Detalhes
              </CButton>
            </td>
          ),
        }}
      ></CSmartTable>

      {activeItem && (
        <CModal visible onClose={() => setActiveItem(null)}>
          <CModalHeader closeButton>Detalhes do Produto</CModalHeader>
          <CModalBody>
            <div>
              <h5>Histórico de Vendas</h5>
              <CChartLine
                data={{
                  labels: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho'],
                  datasets: [
                    {
                      label: 'Vendas',
                      data: activeItem?.salesHistory || [65, 59, 80, 81, 56, 55, 40],
                      backgroundColor: 'rgba(220, 220, 220, 0.2)',
                      borderColor: 'rgba(220, 220, 220, 1)',
                      pointBackgroundColor: 'rgba(220, 220, 220, 1)',
                      pointBorderColor: '#fff',
                    },
                  ],
                }}
              />
            </div>
          </CModalBody>
          <CModalFooter>
            <CButton color="secondary" onClick={() => setActiveItem(null)}>
              Fechar
            </CButton>
          </CModalFooter>
        </CModal>
      )}
      {showAddModal && (
        <CModal visible onClose={() => setShowAddModal(false)}>
          <CModalHeader closeButton>Adicionar Novo Item</CModalHeader>
          <CModalBody>
            <CForm>
              <CFormLabel>Produto</CFormLabel>
              <CFormInput
                placeholder="Nome do Produto"
                value={newItem.product}
                onChange={(e) => setNewItem({ ...newItem, product: e.target.value })}
                className='mb-3'
              ></CFormInput>
              <CFormLabel>Em Estoque</CFormLabel>
              <CFormInput
              type='number'
                placeholder="100"
                value={newItem.inventory}
                onChange={(e) => setNewItem({ ...newItem, inventory: e.target.value })}
                className='mb-3'
              ></CFormInput>
              <CFormLabel>Pedidos</CFormLabel>
              <CFormInput
              type='number'
                placeholder="25"
                value={newItem.orders}
                onChange={(e) => setNewItem({ ...newItem, orders: e.target.value })}
                className='mb-3'
              ></CFormInput>
              <CFormLabel>Valor Unitario</CFormLabel>
              <CFormInput
              type='number'
                placeholder="10.00"
                value={newItem.value}
                onChange={(e) => setNewItem({ ...newItem, value: e.target.value })}
                className='mb-3'
              ></CFormInput>
            </CForm>
          </CModalBody>
          <CModalFooter>
            <CButton color="secondary" onClick={() => setShowAddModal(false)}>
              Cancelar
            </CButton>
            <CButton color="success" onClick={handleAddItem}>
              Salvar
            </CButton>
          </CModalFooter>
        </CModal>
      )}
    </CCol>
  )
}
